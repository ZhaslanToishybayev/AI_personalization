import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_app/domain/assistive_suggestion.dart';
import 'package:flutter_app/domain/consent_audit.dart' as audit_domain;
import 'package:flutter_app/domain/context_signal.dart';
import 'package:flutter_app/domain/notification_queue_entry.dart'
    as notification_domain;
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' as sqflite;

part 'local_store.g.dart';

class ContextSignalEntries extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  IntColumn get source => integer()();
  TextColumn get sourceIdentifier => text()();
  DateTimeColumn get ingestedAt => dateTime()();
  IntColumn get priority => integer()();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  TextColumn get permissionsScope => text()();
  TextColumn get payloadDigest => text()();
  RealColumn get confidenceHint => real().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class AssistiveSuggestionEntries extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get triggerContextIds => text()();
  DateTimeColumn get generatedAt => dateTime()();
  IntColumn get type => integer()();
  TextColumn get message => text()();
  TextColumn get explanation => text()();
  RealColumn get confidenceScore => real()();
  IntColumn get status => integer()();
  TextColumn get feedbackNote => text().nullable()();
  DateTimeColumn get respondedAt => dateTime().nullable()();
  TextColumn get actionsJson => text().withDefault(const Constant('[]'))();
  TextColumn get boundaryChecksJson =>
      text().withDefault(const Constant('[]'))();
  BoolColumn get boundaryViolationFlag =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName('StoredConsentAuditEntry')
class ConsentAuditEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get eventType => text()();
  TextColumn get scope => text()();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get actor => text()();
  TextColumn get notes => text().nullable()();
}

@DataClassName('StoredNotificationQueueEntry')
class NotificationQueueEntries extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get suggestionId => text().nullable()();
  TextColumn get channel => text()();
  IntColumn get priority => integer()();
  BoolColumn get quietHoursOverride =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get scheduledFor => dateTime()();
  DateTimeColumn get deliveredAt => dateTime().nullable()();
  IntColumn get deliveryAttempts => integer().withDefault(const Constant(0))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    ContextSignalEntries,
    AssistiveSuggestionEntries,
    ConsentAuditEntries,
    NotificationQueueEntries,
  ],
)
class LocalStore extends _$LocalStore {
  LocalStore() : super(_openConnection());

  LocalStore.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  Future<void> upsertContextSignals(List<ContextSignal> signals) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        contextSignalEntries,
        signals.map(
          (signal) => ContextSignalEntriesCompanion.insert(
            id: signal.id,
            userId: signal.userId,
            source: signal.source.index,
            sourceIdentifier: signal.sourceIdentifier,
            ingestedAt: signal.ingestedAt,
            priority: signal.priority.index,
            expiresAt: Value(signal.expiresAt),
            permissionsScope: signal.permissionsScope,
            payloadDigest: signal.payloadDigest,
            confidenceHint: Value(signal.confidenceHint),
          ),
        ),
      );
    });
  }

  Future<List<ContextSignal>> activeContextSignals(String userId) async {
    final rows = await (select(
      contextSignalEntries,
    )..where((tbl) => tbl.userId.equals(userId))).get();
    final now = DateTime.now();
    return rows
        .where((row) => row.expiresAt == null || row.expiresAt!.isAfter(now))
        .map(_mapSignalFromRow)
        .toList();
  }

  Future<void> pruneContextSignals({
    Duration retention = const Duration(days: 30),
  }) async {
    final cutoff = DateTime.now().subtract(retention);
    await (delete(
      contextSignalEntries,
    )..where((tbl) => tbl.ingestedAt.isSmallerThanValue(cutoff))).go();
  }

  Future<Map<String, String>> fetchContextSignalDigests(
    Iterable<String> ids,
  ) async {
    final idList = ids.toSet().toList();
    if (idList.isEmpty) {
      return <String, String>{};
    }

    final rows = await (select(contextSignalEntries)
          ..where((tbl) => tbl.id.isIn(idList)))
        .get();

    return {
      for (final row in rows) row.id: row.payloadDigest,
    };
  }

  Future<void> deleteContextSignalsByIds(Iterable<String> ids) async {
    final idList = ids.toSet().toList();
    if (idList.isEmpty) {
      return;
    }

    await (delete(contextSignalEntries)
          ..where((tbl) => tbl.id.isIn(idList)))
        .go();
  }

  Future<void> upsertSuggestions(List<AssistiveSuggestion> suggestions) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        assistiveSuggestionEntries,
        suggestions.map(
          (suggestion) => AssistiveSuggestionEntriesCompanion.insert(
            id: suggestion.id,
            userId: suggestion.userId,
            triggerContextIds: suggestion.triggerContextIds.join(','),
            generatedAt: suggestion.generatedAt,
            type: suggestion.type.index,
            message: suggestion.message,
            explanation: jsonEncode(suggestion.explanation.toJson()),
            confidenceScore: suggestion.confidenceScore,
            status: suggestion.status.index,
            feedbackNote: Value(suggestion.feedbackNote),
            respondedAt: Value(suggestion.respondedAt),
            actionsJson: Value(
              jsonEncode(suggestion.actions.map((e) => e.toJson()).toList()),
            ),
            boundaryChecksJson: Value(
              jsonEncode(
                suggestion.boundaryChecks.map((e) => e.toJson()).toList(),
              ),
            ),
            boundaryViolationFlag: Value(suggestion.boundaryViolationFlag),
          ),
        ),
      );
    });
  }

  Future<List<AssistiveSuggestion>> pendingSuggestions(String userId) async {
    final rows = await (select(
      assistiveSuggestionEntries,
    )..where((tbl) => tbl.userId.equals(userId))).get();
    return rows
        .map(_mapSuggestionFromRow)
        .where((suggestion) => suggestion.status == SuggestionStatus.pending)
        .toList();
  }

  Future<void> purgeResolvedSuggestions({
    Duration retention = const Duration(days: 30),
  }) async {
    final cutoff = DateTime.now().subtract(retention);
    await (delete(assistiveSuggestionEntries)..where(
          (tbl) =>
              tbl.respondedAt.isNotNull() &
              tbl.respondedAt.isSmallerThanValue(cutoff),
        ))
        .go();
  }

  Future<void> insertConsentAuditEntry(
    audit_domain.ConsentAuditEntry entry,
  ) async {
    await into(consentAuditEntries).insert(
      ConsentAuditEntriesCompanion.insert(
        userId: entry.userId,
        eventType: entry.eventType,
        scope: entry.scope,
        occurredAt: entry.occurredAt,
        actor: entry.actor,
        notes: Value(entry.notes),
      ),
    );
  }

  Stream<List<audit_domain.ConsentAuditEntry>> consentAuditLog(String userId) {
    final query =
        (select(consentAuditEntries)
              ..where((tbl) => tbl.userId.equals(userId))
              ..orderBy([(tbl) => OrderingTerm(expression: tbl.occurredAt)]))
            .watch();

    return query.map(
      (rows) => rows
          .map(
            (row) => audit_domain.ConsentAuditEntry(
              userId: row.userId,
              eventType: row.eventType,
              scope: row.scope,
              occurredAt: row.occurredAt,
              actor: row.actor,
              notes: row.notes,
            ),
          )
          .toList(),
    );
  }

  Future<void> purgeConsentAuditEntries(DateTime cutoff) async {
    await (delete(
      consentAuditEntries,
    )..where((tbl) => tbl.occurredAt.isSmallerThanValue(cutoff))).go();
  }

  Future<void> upsertNotification(
    notification_domain.QueuedNotification entry,
  ) async {
    await into(notificationQueueEntries).insertOnConflictUpdate(
      NotificationQueueEntriesCompanion.insert(
        id: entry.id,
        userId: entry.userId,
        suggestionId: Value(entry.suggestionId),
        channel: entry.channel,
        priority: entry.priority.index,
        quietHoursOverride: Value(entry.quietHoursOverride),
        scheduledFor: entry.scheduledFor,
        deliveredAt: Value(entry.deliveredAt),
        deliveryAttempts: Value(entry.deliveryAttempts),
      ),
    );
  }

  Future<List<notification_domain.QueuedNotification>> pendingNotifications(
    String userId, {
    DateTime? reference,
  }) async {
    final now = reference ?? DateTime.now();
    final rows =
        await (select(notificationQueueEntries)..where(
              (tbl) =>
                  tbl.userId.equals(userId) &
                  tbl.scheduledFor.isSmallerOrEqualValue(now) &
                  tbl.deliveredAt.isNull(),
            ))
            .get();

    return rows
        .map<notification_domain.QueuedNotification>(_mapNotificationFromRow)
        .toList();
  }

  Future<void> markNotificationDelivered(String id, DateTime timestamp) async {
    final row = await (select(
      notificationQueueEntries,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (row == null) {
      return;
    }
    await (update(
      notificationQueueEntries,
    )..where((tbl) => tbl.id.equals(id))).write(
      NotificationQueueEntriesCompanion(
        deliveredAt: Value(timestamp),
        deliveryAttempts: Value(row.deliveryAttempts + 1),
      ),
    );
  }

  Future<void> incrementDeliveryAttempt(String id) async {
    final row = await (select(
      notificationQueueEntries,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (row == null) {
      return;
    }
    await (update(
      notificationQueueEntries,
    )..where((tbl) => tbl.id.equals(id))).write(
      NotificationQueueEntriesCompanion(
        deliveryAttempts: Value(row.deliveryAttempts + 1),
      ),
    );
  }

  Future<void> purgeDeliveredNotifications({
    Duration retention = const Duration(days: 2),
  }) async {
    final cutoff = DateTime.now().subtract(retention);
    await (delete(notificationQueueEntries)..where(
          (tbl) =>
              tbl.deliveredAt.isNotNull() &
              tbl.deliveredAt.isSmallerThanValue(cutoff),
        ))
        .go();
  }

  Future<notification_domain.QueuedNotification?> notificationById(
    String id,
  ) async {
    final row = await (select(
      notificationQueueEntries,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    return row == null ? null : _mapNotificationFromRow(row);
  }

  ContextSignal _mapSignalFromRow(ContextSignalEntry row) {
    return ContextSignal(
      id: row.id,
      userId: row.userId,
      source: ContextSource.values[row.source],
      sourceIdentifier: row.sourceIdentifier,
      ingestedAt: row.ingestedAt,
      priority: SignalPriority.values[row.priority],
      expiresAt: row.expiresAt,
      permissionsScope: row.permissionsScope,
      payloadDigest: row.payloadDigest,
      confidenceHint: row.confidenceHint,
    );
  }

  AssistiveSuggestion _mapSuggestionFromRow(AssistiveSuggestionEntry row) {
    final triggerIds = row.triggerContextIds.isEmpty
        ? <String>[]
        : row.triggerContextIds.split(',');
    final actions = (jsonDecode(row.actionsJson) as List<dynamic>)
        .map(
          (item) =>
              SuggestionAction.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
    final explanation = SuggestionExplanation.fromJson(
      Map<String, dynamic>.from(jsonDecode(row.explanation) as Map),
    );
    final boundaryChecks = (jsonDecode(row.boundaryChecksJson) as List<dynamic>)
        .map(
          (item) =>
              BoundaryCheck.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();

    return AssistiveSuggestion(
      id: row.id,
      userId: row.userId,
      triggerContextIds: triggerIds,
      generatedAt: row.generatedAt,
      type: SuggestionType.values[row.type],
      message: row.message,
      explanation: explanation,
      confidenceScore: row.confidenceScore,
      status: SuggestionStatus.values[row.status],
      feedbackNote: row.feedbackNote,
      respondedAt: row.respondedAt,
      actions: actions,
      boundaryChecks: boundaryChecks,
      boundaryViolationFlag: row.boundaryViolationFlag,
    );
  }

  notification_domain.QueuedNotification _mapNotificationFromRow(
    StoredNotificationQueueEntry row,
  ) {
    return notification_domain.QueuedNotification(
      id: row.id,
      userId: row.userId,
      suggestionId: row.suggestionId,
      channel: row.channel,
      priority: notification_domain.NotificationPriority.values[row.priority],
      quietHoursOverride: row.quietHoursOverride,
      scheduledFor: row.scheduledFor,
      deliveredAt: row.deliveredAt,
      deliveryAttempts: row.deliveryAttempts,
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await sqflite.getDatabasesPath();
    final file = File(p.join(dbFolder, 'personal_assistant.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
