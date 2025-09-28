import 'package:collection/collection.dart';

class ConsentAuditEntry {
  ConsentAuditEntry({
    required this.userId,
    required this.eventType,
    required this.scope,
    required this.occurredAt,
    this.actor = 'user',
    this.notes,
  });

  final String userId;
  final String eventType;
  final String scope;
  final DateTime occurredAt;
  final String actor;
  final String? notes;
}

abstract class ConsentAuditLog {
  Future<void> record(ConsentAuditEntry entry);

  Stream<ConsentAuditEntry> entriesForUser(String userId);

  Future<void> purgeBefore(DateTime cutoff);
}

class InMemoryConsentAuditLog implements ConsentAuditLog {
  final List<ConsentAuditEntry> _entries = [];

  @override
  Future<void> record(ConsentAuditEntry entry) async {
    _entries
      ..add(entry)
      ..sortBy((element) => element.occurredAt);
  }

  @override
  Stream<ConsentAuditEntry> entriesForUser(String userId) {
    final snapshot = _entries
        .where((entry) => entry.userId == userId)
        .toList(growable: false);
    return Stream<ConsentAuditEntry>.fromIterable(snapshot);
  }

  @override
  Future<void> purgeBefore(DateTime cutoff) async {
    _entries.removeWhere((entry) => entry.occurredAt.isBefore(cutoff));
  }
}
