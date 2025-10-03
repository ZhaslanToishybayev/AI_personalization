import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_app/data/local/local_store.dart';
import 'package:flutter_app/domain/context_signal.dart';

typedef _Clock = DateTime Function();

class ContextSyncService {
  ContextSyncService({
    required LocalStore localStore,
    required AssistantApiClient apiClient,
    Duration retentionWindow = const Duration(days: 30),
    _Clock? clock,
  }) : _localStore = localStore,
       _apiClient = apiClient,
       _retentionWindow = retentionWindow,
       _clock = clock ?? DateTime.now;

  final LocalStore _localStore;
  final AssistantApiClient _apiClient;
  final Duration _retentionWindow;
  final _Clock _clock;

  Future<void> ingestSignals(List<ContextSignal> signals) async {
    if (signals.isEmpty) {
      return;
    }
    await _localStore.upsertContextSignals(signals);
    await _localStore.pruneContextSignals(retention: _retentionWindow);
  }

  Future<void> syncCalendar({
    required String userId,
    required List<Map<String, dynamic>> events,
    List<String>? deletedEventIds,
    String? syncToken,
    String? serviceToken,
  }) async {
    if (events.isEmpty && (deletedEventIds?.isEmpty ?? true)) {
      return;
    }

    await _apiClient.ingestCalendarEvents(
      userId: userId,
      events: events,
      deletedEventIds: deletedEventIds,
      syncToken: syncToken,
      serviceToken: serviceToken,
    );

    final normalizedEvents = <_CalendarEvent>[];
    final ids = <String>{};

    for (final event in events) {
      final normalized = _CalendarEvent.fromMap(event);
      if (normalized == null) {
        continue;
      }
      normalizedEvents.add(normalized);
      ids.add(
        _stableId(
          userId: userId,
          source: ContextSource.calendar,
          externalId: normalized.externalId,
        ),
      );
    }

    final existingDigests = await _localStore.fetchContextSignalDigests(ids);

    final now = _clock().toUtc();
    final signals = <ContextSignal>[];

    for (final event in normalizedEvents) {
      final id = _stableId(
        userId: userId,
        source: ContextSource.calendar,
        externalId: event.externalId,
      );
      if (existingDigests[id] == event.digest) {
        continue;
      }

      signals.add(
        ContextSignal(
          id: id,
          userId: userId,
          source: ContextSource.calendar,
          sourceIdentifier: event.externalId,
          ingestedAt: now,
          priority: _priorityFromEvent(event.start, now),
          expiresAt: event.end,
          permissionsScope: 'calendar.read',
          payloadDigest: event.digest,
          confidenceHint: event.confidenceHint,
        ),
      );
    }

    if (signals.isNotEmpty) {
      await _localStore.upsertContextSignals(signals);
    }

    if (deletedEventIds != null && deletedEventIds.isNotEmpty) {
      final idsToDelete = deletedEventIds
          .map(
            (externalId) => _stableId(
              userId: userId,
              source: ContextSource.calendar,
              externalId: externalId,
            ),
          )
          .toList();
      await _localStore.deleteContextSignalsByIds(idsToDelete);
    }

    await _localStore.pruneContextSignals(retention: _retentionWindow);
  }

  Future<void> syncGmail({
    required String userId,
    required List<Map<String, dynamic>> messages,
    String? syncToken,
    String? serviceToken,
  }) async {
    if (messages.isEmpty) {
      return;
    }

    await _apiClient.ingestGmailMessages(
      userId: userId,
      messages: messages,
      syncToken: syncToken,
      serviceToken: serviceToken,
    );

    final normalizedMessages = <_GmailMessage>[];
    final ids = <String>{};

    for (final message in messages) {
      final normalized = _GmailMessage.fromMap(message);
      if (normalized == null) {
        continue;
      }
      normalizedMessages.add(normalized);
      ids.add(
        _stableId(
          userId: userId,
          source: ContextSource.email,
          externalId: normalized.externalId,
        ),
      );
    }

    final existingDigests = await _localStore.fetchContextSignalDigests(ids);
    final now = _clock().toUtc();
    final signals = <ContextSignal>[];

    for (final message in normalizedMessages) {
      final id = _stableId(
        userId: userId,
        source: ContextSource.email,
        externalId: message.externalId,
      );
      if (existingDigests[id] == message.digest) {
        continue;
      }

      signals.add(
        ContextSignal(
          id: id,
          userId: userId,
          source: ContextSource.email,
          sourceIdentifier: message.externalId,
          ingestedAt: now,
          priority: message.priority,
          expiresAt: message.expiresAt,
          permissionsScope: 'inbox.read',
          payloadDigest: message.digest,
          confidenceHint: message.confidenceHint,
        ),
      );
    }

    if (signals.isNotEmpty) {
      await _localStore.upsertContextSignals(signals);
    }

    await _localStore.pruneContextSignals(retention: _retentionWindow);
  }

  Future<List<ContextSignal>> activeSignals(String userId) =>
      _localStore.activeContextSignals(userId);

  Future<void> performMaintenance() async {
    await _localStore.pruneContextSignals(retention: _retentionWindow);
    await _localStore.purgeResolvedSuggestions();
  }

  SignalPriority _priorityFromEvent(DateTime start, DateTime reference) {
    final diff = start.difference(reference);
    if (diff.inMinutes <= 30) {
      return SignalPriority.critical;
    }
    if (diff.inHours < 4) {
      return SignalPriority.high;
    }
    if (diff.inHours < 24) {
      return SignalPriority.normal;
    }
    return SignalPriority.low;
  }

  static String _stableId({
    required String userId,
    required ContextSource source,
    required String externalId,
  }) {
    final bytes = utf8.encode('$userId|${source.name}|$externalId');
    return sha256.convert(bytes).toString();
  }

  static String _hashPayload(Map<String, dynamic> payload) {
    final normalized = _normalizeValue(payload);
    final json = jsonEncode(normalized);
    return sha256.convert(utf8.encode(json)).toString();
  }

  static Object? _normalizeValue(Object? value) {
    if (value is Map) {
      final sorted = SplayTreeMap<String, Object?>((a, b) => a.compareTo(b));
      value.forEach((key, dynamic val) {
        if (val != null) {
          sorted[key.toString()] = _normalizeValue(val);
        }
      });
      return sorted;
    }
    if (value is Iterable) {
      return value.map<Object?>(_normalizeValue).toList(growable: false);
    }
    if (value is DateTime) {
      return value.toUtc().toIso8601String();
    }
    return value;
  }
}

class _CalendarEvent {
  _CalendarEvent({
    required this.externalId,
    required this.start,
    required this.end,
    required this.digest,
    this.confidenceHint,
  });

  final String externalId;
  final DateTime start;
  final DateTime? end;
  final String digest;
  final double? confidenceHint;

  static _CalendarEvent? fromMap(Map<String, dynamic> raw) {
    final externalId = raw['external_id'] as String?;
    final startRaw = raw['start'];
    final endRaw = raw['end'];
    final start = _tryParseDateTime(startRaw);
    if (externalId == null || externalId.isEmpty || start == null) {
      return null;
    }

    final end = _tryParseDateTime(endRaw);
    final canonical = <String, dynamic>{
      'external_id': externalId,
      if (raw['title'] != null) 'title': raw['title'],
      if (raw['start'] != null) 'start': raw['start'],
      if (raw['end'] != null) 'end': raw['end'],
      if (raw['location'] != null) 'location': raw['location'],
      if (raw['is_all_day'] != null) 'is_all_day': raw['is_all_day'],
      if (raw['attendees'] != null) 'attendees': raw['attendees'],
      if (raw['status'] != null) 'status': raw['status'],
      if (raw['updated_at'] != null) 'updated_at': raw['updated_at'],
    };

    final digest = ContextSyncService._hashPayload(canonical);
    final confidenceHint = (raw['confidence_hint'] as num?)?.toDouble();

    return _CalendarEvent(
      externalId: externalId,
      start: start,
      end: end,
      digest: digest,
      confidenceHint: confidenceHint,
    );
  }
}

class _GmailMessage {
  _GmailMessage({
    required this.externalId,
    required this.digest,
    required this.priority,
    this.expiresAt,
    this.confidenceHint,
  });

  final String externalId;
  final String digest;
  final SignalPriority priority;
  final DateTime? expiresAt;
  final double? confidenceHint;

  static _GmailMessage? fromMap(Map<String, dynamic> raw) {
    final externalId = raw['external_id'] as String?;
    if (externalId == null || externalId.isEmpty) {
      return null;
    }

    final canonical = <String, dynamic>{
      'external_id': externalId,
      if (raw['received_at'] != null) 'received_at': raw['received_at'],
      if (raw['subject'] != null) 'subject': raw['subject'],
      if (raw['snippet'] != null) 'snippet': raw['snippet'],
      if (raw['thread_id'] != null) 'thread_id': raw['thread_id'],
      if (raw['labels'] != null) 'labels': raw['labels'],
      if (raw['importance'] != null) 'importance': raw['importance'],
    };

    final digest = ContextSyncService._hashPayload(canonical);
    final priority = _priorityFromImportance(raw['importance'] as String?);
    final confidenceHint = _confidenceFromImportance(
      raw['importance'] as String?,
    );
    final receivedAt = _tryParseDateTime(raw['received_at']);

    return _GmailMessage(
      externalId: externalId,
      digest: digest,
      priority: priority,
      expiresAt: receivedAt == null
          ? null
          : receivedAt.add(const Duration(days: 30)),
      confidenceHint: confidenceHint,
    );
  }

  static SignalPriority _priorityFromImportance(String? importance) {
    switch (importance?.toLowerCase()) {
      case 'urgent':
      case 'critical':
        return SignalPriority.critical;
      case 'high':
        return SignalPriority.high;
      case 'low':
        return SignalPriority.low;
      default:
        return SignalPriority.normal;
    }
  }

  static double? _confidenceFromImportance(String? importance) {
    switch (importance?.toLowerCase()) {
      case 'urgent':
      case 'critical':
        return 0.9;
      case 'high':
        return 0.75;
      case 'low':
        return 0.35;
      default:
        return 0.55;
    }
  }
}

DateTime? _tryParseDateTime(Object? value) {
  if (value is DateTime) {
    return value.toUtc();
  }
  if (value is String) {
    return DateTime.tryParse(value)?.toUtc();
  }
  return null;
}
