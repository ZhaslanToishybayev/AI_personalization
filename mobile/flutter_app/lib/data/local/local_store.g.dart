// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_store.dart';

// ignore_for_file: type=lint
class $ContextSignalEntriesTable extends ContextSignalEntries
    with TableInfo<$ContextSignalEntriesTable, ContextSignalEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContextSignalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<int> source = GeneratedColumn<int>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdentifierMeta = const VerificationMeta(
    'sourceIdentifier',
  );
  @override
  late final GeneratedColumn<String> sourceIdentifier = GeneratedColumn<String>(
    'source_identifier',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ingestedAtMeta = const VerificationMeta(
    'ingestedAt',
  );
  @override
  late final GeneratedColumn<DateTime> ingestedAt = GeneratedColumn<DateTime>(
    'ingested_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _permissionsScopeMeta = const VerificationMeta(
    'permissionsScope',
  );
  @override
  late final GeneratedColumn<String> permissionsScope = GeneratedColumn<String>(
    'permissions_scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadDigestMeta = const VerificationMeta(
    'payloadDigest',
  );
  @override
  late final GeneratedColumn<String> payloadDigest = GeneratedColumn<String>(
    'payload_digest',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceHintMeta = const VerificationMeta(
    'confidenceHint',
  );
  @override
  late final GeneratedColumn<double> confidenceHint = GeneratedColumn<double>(
    'confidence_hint',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    source,
    sourceIdentifier,
    ingestedAt,
    priority,
    expiresAt,
    permissionsScope,
    payloadDigest,
    confidenceHint,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'context_signal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContextSignalEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('source_identifier')) {
      context.handle(
        _sourceIdentifierMeta,
        sourceIdentifier.isAcceptableOrUnknown(
          data['source_identifier']!,
          _sourceIdentifierMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceIdentifierMeta);
    }
    if (data.containsKey('ingested_at')) {
      context.handle(
        _ingestedAtMeta,
        ingestedAt.isAcceptableOrUnknown(data['ingested_at']!, _ingestedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_ingestedAtMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('permissions_scope')) {
      context.handle(
        _permissionsScopeMeta,
        permissionsScope.isAcceptableOrUnknown(
          data['permissions_scope']!,
          _permissionsScopeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_permissionsScopeMeta);
    }
    if (data.containsKey('payload_digest')) {
      context.handle(
        _payloadDigestMeta,
        payloadDigest.isAcceptableOrUnknown(
          data['payload_digest']!,
          _payloadDigestMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadDigestMeta);
    }
    if (data.containsKey('confidence_hint')) {
      context.handle(
        _confidenceHintMeta,
        confidenceHint.isAcceptableOrUnknown(
          data['confidence_hint']!,
          _confidenceHintMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContextSignalEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContextSignalEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source'],
      )!,
      sourceIdentifier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_identifier'],
      )!,
      ingestedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ingested_at'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      ),
      permissionsScope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}permissions_scope'],
      )!,
      payloadDigest: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_digest'],
      )!,
      confidenceHint: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence_hint'],
      ),
    );
  }

  @override
  $ContextSignalEntriesTable createAlias(String alias) {
    return $ContextSignalEntriesTable(attachedDatabase, alias);
  }
}

class ContextSignalEntry extends DataClass
    implements Insertable<ContextSignalEntry> {
  final String id;
  final String userId;
  final int source;
  final String sourceIdentifier;
  final DateTime ingestedAt;
  final int priority;
  final DateTime? expiresAt;
  final String permissionsScope;
  final String payloadDigest;
  final double? confidenceHint;
  const ContextSignalEntry({
    required this.id,
    required this.userId,
    required this.source,
    required this.sourceIdentifier,
    required this.ingestedAt,
    required this.priority,
    this.expiresAt,
    required this.permissionsScope,
    required this.payloadDigest,
    this.confidenceHint,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['source'] = Variable<int>(source);
    map['source_identifier'] = Variable<String>(sourceIdentifier);
    map['ingested_at'] = Variable<DateTime>(ingestedAt);
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    map['permissions_scope'] = Variable<String>(permissionsScope);
    map['payload_digest'] = Variable<String>(payloadDigest);
    if (!nullToAbsent || confidenceHint != null) {
      map['confidence_hint'] = Variable<double>(confidenceHint);
    }
    return map;
  }

  ContextSignalEntriesCompanion toCompanion(bool nullToAbsent) {
    return ContextSignalEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      source: Value(source),
      sourceIdentifier: Value(sourceIdentifier),
      ingestedAt: Value(ingestedAt),
      priority: Value(priority),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      permissionsScope: Value(permissionsScope),
      payloadDigest: Value(payloadDigest),
      confidenceHint: confidenceHint == null && nullToAbsent
          ? const Value.absent()
          : Value(confidenceHint),
    );
  }

  factory ContextSignalEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContextSignalEntry(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      source: serializer.fromJson<int>(json['source']),
      sourceIdentifier: serializer.fromJson<String>(json['sourceIdentifier']),
      ingestedAt: serializer.fromJson<DateTime>(json['ingestedAt']),
      priority: serializer.fromJson<int>(json['priority']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      permissionsScope: serializer.fromJson<String>(json['permissionsScope']),
      payloadDigest: serializer.fromJson<String>(json['payloadDigest']),
      confidenceHint: serializer.fromJson<double?>(json['confidenceHint']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'source': serializer.toJson<int>(source),
      'sourceIdentifier': serializer.toJson<String>(sourceIdentifier),
      'ingestedAt': serializer.toJson<DateTime>(ingestedAt),
      'priority': serializer.toJson<int>(priority),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'permissionsScope': serializer.toJson<String>(permissionsScope),
      'payloadDigest': serializer.toJson<String>(payloadDigest),
      'confidenceHint': serializer.toJson<double?>(confidenceHint),
    };
  }

  ContextSignalEntry copyWith({
    String? id,
    String? userId,
    int? source,
    String? sourceIdentifier,
    DateTime? ingestedAt,
    int? priority,
    Value<DateTime?> expiresAt = const Value.absent(),
    String? permissionsScope,
    String? payloadDigest,
    Value<double?> confidenceHint = const Value.absent(),
  }) => ContextSignalEntry(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    source: source ?? this.source,
    sourceIdentifier: sourceIdentifier ?? this.sourceIdentifier,
    ingestedAt: ingestedAt ?? this.ingestedAt,
    priority: priority ?? this.priority,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
    permissionsScope: permissionsScope ?? this.permissionsScope,
    payloadDigest: payloadDigest ?? this.payloadDigest,
    confidenceHint: confidenceHint.present
        ? confidenceHint.value
        : this.confidenceHint,
  );
  ContextSignalEntry copyWithCompanion(ContextSignalEntriesCompanion data) {
    return ContextSignalEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      source: data.source.present ? data.source.value : this.source,
      sourceIdentifier: data.sourceIdentifier.present
          ? data.sourceIdentifier.value
          : this.sourceIdentifier,
      ingestedAt: data.ingestedAt.present
          ? data.ingestedAt.value
          : this.ingestedAt,
      priority: data.priority.present ? data.priority.value : this.priority,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      permissionsScope: data.permissionsScope.present
          ? data.permissionsScope.value
          : this.permissionsScope,
      payloadDigest: data.payloadDigest.present
          ? data.payloadDigest.value
          : this.payloadDigest,
      confidenceHint: data.confidenceHint.present
          ? data.confidenceHint.value
          : this.confidenceHint,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContextSignalEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('source: $source, ')
          ..write('sourceIdentifier: $sourceIdentifier, ')
          ..write('ingestedAt: $ingestedAt, ')
          ..write('priority: $priority, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('permissionsScope: $permissionsScope, ')
          ..write('payloadDigest: $payloadDigest, ')
          ..write('confidenceHint: $confidenceHint')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    source,
    sourceIdentifier,
    ingestedAt,
    priority,
    expiresAt,
    permissionsScope,
    payloadDigest,
    confidenceHint,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContextSignalEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.source == this.source &&
          other.sourceIdentifier == this.sourceIdentifier &&
          other.ingestedAt == this.ingestedAt &&
          other.priority == this.priority &&
          other.expiresAt == this.expiresAt &&
          other.permissionsScope == this.permissionsScope &&
          other.payloadDigest == this.payloadDigest &&
          other.confidenceHint == this.confidenceHint);
}

class ContextSignalEntriesCompanion
    extends UpdateCompanion<ContextSignalEntry> {
  final Value<String> id;
  final Value<String> userId;
  final Value<int> source;
  final Value<String> sourceIdentifier;
  final Value<DateTime> ingestedAt;
  final Value<int> priority;
  final Value<DateTime?> expiresAt;
  final Value<String> permissionsScope;
  final Value<String> payloadDigest;
  final Value<double?> confidenceHint;
  final Value<int> rowid;
  const ContextSignalEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.source = const Value.absent(),
    this.sourceIdentifier = const Value.absent(),
    this.ingestedAt = const Value.absent(),
    this.priority = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.permissionsScope = const Value.absent(),
    this.payloadDigest = const Value.absent(),
    this.confidenceHint = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContextSignalEntriesCompanion.insert({
    required String id,
    required String userId,
    required int source,
    required String sourceIdentifier,
    required DateTime ingestedAt,
    required int priority,
    this.expiresAt = const Value.absent(),
    required String permissionsScope,
    required String payloadDigest,
    this.confidenceHint = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       source = Value(source),
       sourceIdentifier = Value(sourceIdentifier),
       ingestedAt = Value(ingestedAt),
       priority = Value(priority),
       permissionsScope = Value(permissionsScope),
       payloadDigest = Value(payloadDigest);
  static Insertable<ContextSignalEntry> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<int>? source,
    Expression<String>? sourceIdentifier,
    Expression<DateTime>? ingestedAt,
    Expression<int>? priority,
    Expression<DateTime>? expiresAt,
    Expression<String>? permissionsScope,
    Expression<String>? payloadDigest,
    Expression<double>? confidenceHint,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (source != null) 'source': source,
      if (sourceIdentifier != null) 'source_identifier': sourceIdentifier,
      if (ingestedAt != null) 'ingested_at': ingestedAt,
      if (priority != null) 'priority': priority,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (permissionsScope != null) 'permissions_scope': permissionsScope,
      if (payloadDigest != null) 'payload_digest': payloadDigest,
      if (confidenceHint != null) 'confidence_hint': confidenceHint,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContextSignalEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<int>? source,
    Value<String>? sourceIdentifier,
    Value<DateTime>? ingestedAt,
    Value<int>? priority,
    Value<DateTime?>? expiresAt,
    Value<String>? permissionsScope,
    Value<String>? payloadDigest,
    Value<double?>? confidenceHint,
    Value<int>? rowid,
  }) {
    return ContextSignalEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      source: source ?? this.source,
      sourceIdentifier: sourceIdentifier ?? this.sourceIdentifier,
      ingestedAt: ingestedAt ?? this.ingestedAt,
      priority: priority ?? this.priority,
      expiresAt: expiresAt ?? this.expiresAt,
      permissionsScope: permissionsScope ?? this.permissionsScope,
      payloadDigest: payloadDigest ?? this.payloadDigest,
      confidenceHint: confidenceHint ?? this.confidenceHint,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(source.value);
    }
    if (sourceIdentifier.present) {
      map['source_identifier'] = Variable<String>(sourceIdentifier.value);
    }
    if (ingestedAt.present) {
      map['ingested_at'] = Variable<DateTime>(ingestedAt.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (permissionsScope.present) {
      map['permissions_scope'] = Variable<String>(permissionsScope.value);
    }
    if (payloadDigest.present) {
      map['payload_digest'] = Variable<String>(payloadDigest.value);
    }
    if (confidenceHint.present) {
      map['confidence_hint'] = Variable<double>(confidenceHint.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContextSignalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('source: $source, ')
          ..write('sourceIdentifier: $sourceIdentifier, ')
          ..write('ingestedAt: $ingestedAt, ')
          ..write('priority: $priority, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('permissionsScope: $permissionsScope, ')
          ..write('payloadDigest: $payloadDigest, ')
          ..write('confidenceHint: $confidenceHint, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssistiveSuggestionEntriesTable extends AssistiveSuggestionEntries
    with TableInfo<$AssistiveSuggestionEntriesTable, AssistiveSuggestionEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssistiveSuggestionEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggerContextIdsMeta = const VerificationMeta(
    'triggerContextIds',
  );
  @override
  late final GeneratedColumn<String> triggerContextIds =
      GeneratedColumn<String>(
        'trigger_context_ids',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta(
    'generatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceScoreMeta = const VerificationMeta(
    'confidenceScore',
  );
  @override
  late final GeneratedColumn<double> confidenceScore = GeneratedColumn<double>(
    'confidence_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feedbackNoteMeta = const VerificationMeta(
    'feedbackNote',
  );
  @override
  late final GeneratedColumn<String> feedbackNote = GeneratedColumn<String>(
    'feedback_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _respondedAtMeta = const VerificationMeta(
    'respondedAt',
  );
  @override
  late final GeneratedColumn<DateTime> respondedAt = GeneratedColumn<DateTime>(
    'responded_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionsJsonMeta = const VerificationMeta(
    'actionsJson',
  );
  @override
  late final GeneratedColumn<String> actionsJson = GeneratedColumn<String>(
    'actions_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _boundaryChecksJsonMeta =
      const VerificationMeta('boundaryChecksJson');
  @override
  late final GeneratedColumn<String> boundaryChecksJson =
      GeneratedColumn<String>(
        'boundary_checks_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('[]'),
      );
  static const VerificationMeta _boundaryViolationFlagMeta =
      const VerificationMeta('boundaryViolationFlag');
  @override
  late final GeneratedColumn<bool> boundaryViolationFlag =
      GeneratedColumn<bool>(
        'boundary_violation_flag',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("boundary_violation_flag" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    triggerContextIds,
    generatedAt,
    type,
    message,
    explanation,
    confidenceScore,
    status,
    feedbackNote,
    respondedAt,
    actionsJson,
    boundaryChecksJson,
    boundaryViolationFlag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assistive_suggestion_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssistiveSuggestionEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('trigger_context_ids')) {
      context.handle(
        _triggerContextIdsMeta,
        triggerContextIds.isAcceptableOrUnknown(
          data['trigger_context_ids']!,
          _triggerContextIdsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggerContextIdsMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
        _generatedAtMeta,
        generatedAt.isAcceptableOrUnknown(
          data['generated_at']!,
          _generatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('confidence_score')) {
      context.handle(
        _confidenceScoreMeta,
        confidenceScore.isAcceptableOrUnknown(
          data['confidence_score']!,
          _confidenceScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_confidenceScoreMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('feedback_note')) {
      context.handle(
        _feedbackNoteMeta,
        feedbackNote.isAcceptableOrUnknown(
          data['feedback_note']!,
          _feedbackNoteMeta,
        ),
      );
    }
    if (data.containsKey('responded_at')) {
      context.handle(
        _respondedAtMeta,
        respondedAt.isAcceptableOrUnknown(
          data['responded_at']!,
          _respondedAtMeta,
        ),
      );
    }
    if (data.containsKey('actions_json')) {
      context.handle(
        _actionsJsonMeta,
        actionsJson.isAcceptableOrUnknown(
          data['actions_json']!,
          _actionsJsonMeta,
        ),
      );
    }
    if (data.containsKey('boundary_checks_json')) {
      context.handle(
        _boundaryChecksJsonMeta,
        boundaryChecksJson.isAcceptableOrUnknown(
          data['boundary_checks_json']!,
          _boundaryChecksJsonMeta,
        ),
      );
    }
    if (data.containsKey('boundary_violation_flag')) {
      context.handle(
        _boundaryViolationFlagMeta,
        boundaryViolationFlag.isAcceptableOrUnknown(
          data['boundary_violation_flag']!,
          _boundaryViolationFlagMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssistiveSuggestionEntry map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssistiveSuggestionEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      triggerContextIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger_context_ids'],
      )!,
      generatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}generated_at'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      )!,
      confidenceScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence_score'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      feedbackNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feedback_note'],
      ),
      respondedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}responded_at'],
      ),
      actionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actions_json'],
      )!,
      boundaryChecksJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}boundary_checks_json'],
      )!,
      boundaryViolationFlag: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}boundary_violation_flag'],
      )!,
    );
  }

  @override
  $AssistiveSuggestionEntriesTable createAlias(String alias) {
    return $AssistiveSuggestionEntriesTable(attachedDatabase, alias);
  }
}

class AssistiveSuggestionEntry extends DataClass
    implements Insertable<AssistiveSuggestionEntry> {
  final String id;
  final String userId;
  final String triggerContextIds;
  final DateTime generatedAt;
  final int type;
  final String message;
  final String explanation;
  final double confidenceScore;
  final int status;
  final String? feedbackNote;
  final DateTime? respondedAt;
  final String actionsJson;
  final String boundaryChecksJson;
  final bool boundaryViolationFlag;
  const AssistiveSuggestionEntry({
    required this.id,
    required this.userId,
    required this.triggerContextIds,
    required this.generatedAt,
    required this.type,
    required this.message,
    required this.explanation,
    required this.confidenceScore,
    required this.status,
    this.feedbackNote,
    this.respondedAt,
    required this.actionsJson,
    required this.boundaryChecksJson,
    required this.boundaryViolationFlag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['trigger_context_ids'] = Variable<String>(triggerContextIds);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['type'] = Variable<int>(type);
    map['message'] = Variable<String>(message);
    map['explanation'] = Variable<String>(explanation);
    map['confidence_score'] = Variable<double>(confidenceScore);
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || feedbackNote != null) {
      map['feedback_note'] = Variable<String>(feedbackNote);
    }
    if (!nullToAbsent || respondedAt != null) {
      map['responded_at'] = Variable<DateTime>(respondedAt);
    }
    map['actions_json'] = Variable<String>(actionsJson);
    map['boundary_checks_json'] = Variable<String>(boundaryChecksJson);
    map['boundary_violation_flag'] = Variable<bool>(boundaryViolationFlag);
    return map;
  }

  AssistiveSuggestionEntriesCompanion toCompanion(bool nullToAbsent) {
    return AssistiveSuggestionEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      triggerContextIds: Value(triggerContextIds),
      generatedAt: Value(generatedAt),
      type: Value(type),
      message: Value(message),
      explanation: Value(explanation),
      confidenceScore: Value(confidenceScore),
      status: Value(status),
      feedbackNote: feedbackNote == null && nullToAbsent
          ? const Value.absent()
          : Value(feedbackNote),
      respondedAt: respondedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(respondedAt),
      actionsJson: Value(actionsJson),
      boundaryChecksJson: Value(boundaryChecksJson),
      boundaryViolationFlag: Value(boundaryViolationFlag),
    );
  }

  factory AssistiveSuggestionEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssistiveSuggestionEntry(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      triggerContextIds: serializer.fromJson<String>(json['triggerContextIds']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      type: serializer.fromJson<int>(json['type']),
      message: serializer.fromJson<String>(json['message']),
      explanation: serializer.fromJson<String>(json['explanation']),
      confidenceScore: serializer.fromJson<double>(json['confidenceScore']),
      status: serializer.fromJson<int>(json['status']),
      feedbackNote: serializer.fromJson<String?>(json['feedbackNote']),
      respondedAt: serializer.fromJson<DateTime?>(json['respondedAt']),
      actionsJson: serializer.fromJson<String>(json['actionsJson']),
      boundaryChecksJson: serializer.fromJson<String>(
        json['boundaryChecksJson'],
      ),
      boundaryViolationFlag: serializer.fromJson<bool>(
        json['boundaryViolationFlag'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'triggerContextIds': serializer.toJson<String>(triggerContextIds),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'type': serializer.toJson<int>(type),
      'message': serializer.toJson<String>(message),
      'explanation': serializer.toJson<String>(explanation),
      'confidenceScore': serializer.toJson<double>(confidenceScore),
      'status': serializer.toJson<int>(status),
      'feedbackNote': serializer.toJson<String?>(feedbackNote),
      'respondedAt': serializer.toJson<DateTime?>(respondedAt),
      'actionsJson': serializer.toJson<String>(actionsJson),
      'boundaryChecksJson': serializer.toJson<String>(boundaryChecksJson),
      'boundaryViolationFlag': serializer.toJson<bool>(boundaryViolationFlag),
    };
  }

  AssistiveSuggestionEntry copyWith({
    String? id,
    String? userId,
    String? triggerContextIds,
    DateTime? generatedAt,
    int? type,
    String? message,
    String? explanation,
    double? confidenceScore,
    int? status,
    Value<String?> feedbackNote = const Value.absent(),
    Value<DateTime?> respondedAt = const Value.absent(),
    String? actionsJson,
    String? boundaryChecksJson,
    bool? boundaryViolationFlag,
  }) => AssistiveSuggestionEntry(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    triggerContextIds: triggerContextIds ?? this.triggerContextIds,
    generatedAt: generatedAt ?? this.generatedAt,
    type: type ?? this.type,
    message: message ?? this.message,
    explanation: explanation ?? this.explanation,
    confidenceScore: confidenceScore ?? this.confidenceScore,
    status: status ?? this.status,
    feedbackNote: feedbackNote.present ? feedbackNote.value : this.feedbackNote,
    respondedAt: respondedAt.present ? respondedAt.value : this.respondedAt,
    actionsJson: actionsJson ?? this.actionsJson,
    boundaryChecksJson: boundaryChecksJson ?? this.boundaryChecksJson,
    boundaryViolationFlag: boundaryViolationFlag ?? this.boundaryViolationFlag,
  );
  AssistiveSuggestionEntry copyWithCompanion(
    AssistiveSuggestionEntriesCompanion data,
  ) {
    return AssistiveSuggestionEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      triggerContextIds: data.triggerContextIds.present
          ? data.triggerContextIds.value
          : this.triggerContextIds,
      generatedAt: data.generatedAt.present
          ? data.generatedAt.value
          : this.generatedAt,
      type: data.type.present ? data.type.value : this.type,
      message: data.message.present ? data.message.value : this.message,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      confidenceScore: data.confidenceScore.present
          ? data.confidenceScore.value
          : this.confidenceScore,
      status: data.status.present ? data.status.value : this.status,
      feedbackNote: data.feedbackNote.present
          ? data.feedbackNote.value
          : this.feedbackNote,
      respondedAt: data.respondedAt.present
          ? data.respondedAt.value
          : this.respondedAt,
      actionsJson: data.actionsJson.present
          ? data.actionsJson.value
          : this.actionsJson,
      boundaryChecksJson: data.boundaryChecksJson.present
          ? data.boundaryChecksJson.value
          : this.boundaryChecksJson,
      boundaryViolationFlag: data.boundaryViolationFlag.present
          ? data.boundaryViolationFlag.value
          : this.boundaryViolationFlag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssistiveSuggestionEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('triggerContextIds: $triggerContextIds, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('type: $type, ')
          ..write('message: $message, ')
          ..write('explanation: $explanation, ')
          ..write('confidenceScore: $confidenceScore, ')
          ..write('status: $status, ')
          ..write('feedbackNote: $feedbackNote, ')
          ..write('respondedAt: $respondedAt, ')
          ..write('actionsJson: $actionsJson, ')
          ..write('boundaryChecksJson: $boundaryChecksJson, ')
          ..write('boundaryViolationFlag: $boundaryViolationFlag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    triggerContextIds,
    generatedAt,
    type,
    message,
    explanation,
    confidenceScore,
    status,
    feedbackNote,
    respondedAt,
    actionsJson,
    boundaryChecksJson,
    boundaryViolationFlag,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssistiveSuggestionEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.triggerContextIds == this.triggerContextIds &&
          other.generatedAt == this.generatedAt &&
          other.type == this.type &&
          other.message == this.message &&
          other.explanation == this.explanation &&
          other.confidenceScore == this.confidenceScore &&
          other.status == this.status &&
          other.feedbackNote == this.feedbackNote &&
          other.respondedAt == this.respondedAt &&
          other.actionsJson == this.actionsJson &&
          other.boundaryChecksJson == this.boundaryChecksJson &&
          other.boundaryViolationFlag == this.boundaryViolationFlag);
}

class AssistiveSuggestionEntriesCompanion
    extends UpdateCompanion<AssistiveSuggestionEntry> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> triggerContextIds;
  final Value<DateTime> generatedAt;
  final Value<int> type;
  final Value<String> message;
  final Value<String> explanation;
  final Value<double> confidenceScore;
  final Value<int> status;
  final Value<String?> feedbackNote;
  final Value<DateTime?> respondedAt;
  final Value<String> actionsJson;
  final Value<String> boundaryChecksJson;
  final Value<bool> boundaryViolationFlag;
  final Value<int> rowid;
  const AssistiveSuggestionEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.triggerContextIds = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.type = const Value.absent(),
    this.message = const Value.absent(),
    this.explanation = const Value.absent(),
    this.confidenceScore = const Value.absent(),
    this.status = const Value.absent(),
    this.feedbackNote = const Value.absent(),
    this.respondedAt = const Value.absent(),
    this.actionsJson = const Value.absent(),
    this.boundaryChecksJson = const Value.absent(),
    this.boundaryViolationFlag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssistiveSuggestionEntriesCompanion.insert({
    required String id,
    required String userId,
    required String triggerContextIds,
    required DateTime generatedAt,
    required int type,
    required String message,
    required String explanation,
    required double confidenceScore,
    required int status,
    this.feedbackNote = const Value.absent(),
    this.respondedAt = const Value.absent(),
    this.actionsJson = const Value.absent(),
    this.boundaryChecksJson = const Value.absent(),
    this.boundaryViolationFlag = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       triggerContextIds = Value(triggerContextIds),
       generatedAt = Value(generatedAt),
       type = Value(type),
       message = Value(message),
       explanation = Value(explanation),
       confidenceScore = Value(confidenceScore),
       status = Value(status);
  static Insertable<AssistiveSuggestionEntry> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? triggerContextIds,
    Expression<DateTime>? generatedAt,
    Expression<int>? type,
    Expression<String>? message,
    Expression<String>? explanation,
    Expression<double>? confidenceScore,
    Expression<int>? status,
    Expression<String>? feedbackNote,
    Expression<DateTime>? respondedAt,
    Expression<String>? actionsJson,
    Expression<String>? boundaryChecksJson,
    Expression<bool>? boundaryViolationFlag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (triggerContextIds != null) 'trigger_context_ids': triggerContextIds,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (type != null) 'type': type,
      if (message != null) 'message': message,
      if (explanation != null) 'explanation': explanation,
      if (confidenceScore != null) 'confidence_score': confidenceScore,
      if (status != null) 'status': status,
      if (feedbackNote != null) 'feedback_note': feedbackNote,
      if (respondedAt != null) 'responded_at': respondedAt,
      if (actionsJson != null) 'actions_json': actionsJson,
      if (boundaryChecksJson != null)
        'boundary_checks_json': boundaryChecksJson,
      if (boundaryViolationFlag != null)
        'boundary_violation_flag': boundaryViolationFlag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssistiveSuggestionEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? triggerContextIds,
    Value<DateTime>? generatedAt,
    Value<int>? type,
    Value<String>? message,
    Value<String>? explanation,
    Value<double>? confidenceScore,
    Value<int>? status,
    Value<String?>? feedbackNote,
    Value<DateTime?>? respondedAt,
    Value<String>? actionsJson,
    Value<String>? boundaryChecksJson,
    Value<bool>? boundaryViolationFlag,
    Value<int>? rowid,
  }) {
    return AssistiveSuggestionEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      triggerContextIds: triggerContextIds ?? this.triggerContextIds,
      generatedAt: generatedAt ?? this.generatedAt,
      type: type ?? this.type,
      message: message ?? this.message,
      explanation: explanation ?? this.explanation,
      confidenceScore: confidenceScore ?? this.confidenceScore,
      status: status ?? this.status,
      feedbackNote: feedbackNote ?? this.feedbackNote,
      respondedAt: respondedAt ?? this.respondedAt,
      actionsJson: actionsJson ?? this.actionsJson,
      boundaryChecksJson: boundaryChecksJson ?? this.boundaryChecksJson,
      boundaryViolationFlag:
          boundaryViolationFlag ?? this.boundaryViolationFlag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (triggerContextIds.present) {
      map['trigger_context_ids'] = Variable<String>(triggerContextIds.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (confidenceScore.present) {
      map['confidence_score'] = Variable<double>(confidenceScore.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (feedbackNote.present) {
      map['feedback_note'] = Variable<String>(feedbackNote.value);
    }
    if (respondedAt.present) {
      map['responded_at'] = Variable<DateTime>(respondedAt.value);
    }
    if (actionsJson.present) {
      map['actions_json'] = Variable<String>(actionsJson.value);
    }
    if (boundaryChecksJson.present) {
      map['boundary_checks_json'] = Variable<String>(boundaryChecksJson.value);
    }
    if (boundaryViolationFlag.present) {
      map['boundary_violation_flag'] = Variable<bool>(
        boundaryViolationFlag.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssistiveSuggestionEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('triggerContextIds: $triggerContextIds, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('type: $type, ')
          ..write('message: $message, ')
          ..write('explanation: $explanation, ')
          ..write('confidenceScore: $confidenceScore, ')
          ..write('status: $status, ')
          ..write('feedbackNote: $feedbackNote, ')
          ..write('respondedAt: $respondedAt, ')
          ..write('actionsJson: $actionsJson, ')
          ..write('boundaryChecksJson: $boundaryChecksJson, ')
          ..write('boundaryViolationFlag: $boundaryViolationFlag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConsentAuditEntriesTable extends ConsentAuditEntries
    with TableInfo<$ConsentAuditEntriesTable, StoredConsentAuditEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConsentAuditEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actorMeta = const VerificationMeta('actor');
  @override
  late final GeneratedColumn<String> actor = GeneratedColumn<String>(
    'actor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    eventType,
    scope,
    occurredAt,
    actor,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'consent_audit_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoredConsentAuditEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
        _scopeMeta,
        scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta),
      );
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('actor')) {
      context.handle(
        _actorMeta,
        actor.isAcceptableOrUnknown(data['actor']!, _actorMeta),
      );
    } else if (isInserting) {
      context.missing(_actorMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoredConsentAuditEntry map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredConsentAuditEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      scope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      actor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actor'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ConsentAuditEntriesTable createAlias(String alias) {
    return $ConsentAuditEntriesTable(attachedDatabase, alias);
  }
}

class StoredConsentAuditEntry extends DataClass
    implements Insertable<StoredConsentAuditEntry> {
  final int id;
  final String userId;
  final String eventType;
  final String scope;
  final DateTime occurredAt;
  final String actor;
  final String? notes;
  const StoredConsentAuditEntry({
    required this.id,
    required this.userId,
    required this.eventType,
    required this.scope,
    required this.occurredAt,
    required this.actor,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['event_type'] = Variable<String>(eventType);
    map['scope'] = Variable<String>(scope);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['actor'] = Variable<String>(actor);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ConsentAuditEntriesCompanion toCompanion(bool nullToAbsent) {
    return ConsentAuditEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      eventType: Value(eventType),
      scope: Value(scope),
      occurredAt: Value(occurredAt),
      actor: Value(actor),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory StoredConsentAuditEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredConsentAuditEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      eventType: serializer.fromJson<String>(json['eventType']),
      scope: serializer.fromJson<String>(json['scope']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      actor: serializer.fromJson<String>(json['actor']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'eventType': serializer.toJson<String>(eventType),
      'scope': serializer.toJson<String>(scope),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'actor': serializer.toJson<String>(actor),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  StoredConsentAuditEntry copyWith({
    int? id,
    String? userId,
    String? eventType,
    String? scope,
    DateTime? occurredAt,
    String? actor,
    Value<String?> notes = const Value.absent(),
  }) => StoredConsentAuditEntry(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    eventType: eventType ?? this.eventType,
    scope: scope ?? this.scope,
    occurredAt: occurredAt ?? this.occurredAt,
    actor: actor ?? this.actor,
    notes: notes.present ? notes.value : this.notes,
  );
  StoredConsentAuditEntry copyWithCompanion(ConsentAuditEntriesCompanion data) {
    return StoredConsentAuditEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      scope: data.scope.present ? data.scope.value : this.scope,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      actor: data.actor.present ? data.actor.value : this.actor,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoredConsentAuditEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('eventType: $eventType, ')
          ..write('scope: $scope, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('actor: $actor, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, eventType, scope, occurredAt, actor, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredConsentAuditEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.eventType == this.eventType &&
          other.scope == this.scope &&
          other.occurredAt == this.occurredAt &&
          other.actor == this.actor &&
          other.notes == this.notes);
}

class ConsentAuditEntriesCompanion
    extends UpdateCompanion<StoredConsentAuditEntry> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> eventType;
  final Value<String> scope;
  final Value<DateTime> occurredAt;
  final Value<String> actor;
  final Value<String?> notes;
  const ConsentAuditEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.eventType = const Value.absent(),
    this.scope = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.actor = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ConsentAuditEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String eventType,
    required String scope,
    required DateTime occurredAt,
    required String actor,
    this.notes = const Value.absent(),
  }) : userId = Value(userId),
       eventType = Value(eventType),
       scope = Value(scope),
       occurredAt = Value(occurredAt),
       actor = Value(actor);
  static Insertable<StoredConsentAuditEntry> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? eventType,
    Expression<String>? scope,
    Expression<DateTime>? occurredAt,
    Expression<String>? actor,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (eventType != null) 'event_type': eventType,
      if (scope != null) 'scope': scope,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (actor != null) 'actor': actor,
      if (notes != null) 'notes': notes,
    });
  }

  ConsentAuditEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? eventType,
    Value<String>? scope,
    Value<DateTime>? occurredAt,
    Value<String>? actor,
    Value<String?>? notes,
  }) {
    return ConsentAuditEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      eventType: eventType ?? this.eventType,
      scope: scope ?? this.scope,
      occurredAt: occurredAt ?? this.occurredAt,
      actor: actor ?? this.actor,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (actor.present) {
      map['actor'] = Variable<String>(actor.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsentAuditEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('eventType: $eventType, ')
          ..write('scope: $scope, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('actor: $actor, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $NotificationQueueEntriesTable extends NotificationQueueEntries
    with
        TableInfo<
          $NotificationQueueEntriesTable,
          StoredNotificationQueueEntry
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationQueueEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _suggestionIdMeta = const VerificationMeta(
    'suggestionId',
  );
  @override
  late final GeneratedColumn<String> suggestionId = GeneratedColumn<String>(
    'suggestion_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
    'channel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quietHoursOverrideMeta =
      const VerificationMeta('quietHoursOverride');
  @override
  late final GeneratedColumn<bool> quietHoursOverride = GeneratedColumn<bool>(
    'quiet_hours_override',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("quiet_hours_override" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _scheduledForMeta = const VerificationMeta(
    'scheduledFor',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledFor = GeneratedColumn<DateTime>(
    'scheduled_for',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deliveredAtMeta = const VerificationMeta(
    'deliveredAt',
  );
  @override
  late final GeneratedColumn<DateTime> deliveredAt = GeneratedColumn<DateTime>(
    'delivered_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deliveryAttemptsMeta = const VerificationMeta(
    'deliveryAttempts',
  );
  @override
  late final GeneratedColumn<int> deliveryAttempts = GeneratedColumn<int>(
    'delivery_attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    suggestionId,
    channel,
    priority,
    quietHoursOverride,
    scheduledFor,
    deliveredAt,
    deliveryAttempts,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_queue_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoredNotificationQueueEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('suggestion_id')) {
      context.handle(
        _suggestionIdMeta,
        suggestionId.isAcceptableOrUnknown(
          data['suggestion_id']!,
          _suggestionIdMeta,
        ),
      );
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('quiet_hours_override')) {
      context.handle(
        _quietHoursOverrideMeta,
        quietHoursOverride.isAcceptableOrUnknown(
          data['quiet_hours_override']!,
          _quietHoursOverrideMeta,
        ),
      );
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
        _scheduledForMeta,
        scheduledFor.isAcceptableOrUnknown(
          data['scheduled_for']!,
          _scheduledForMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    if (data.containsKey('delivered_at')) {
      context.handle(
        _deliveredAtMeta,
        deliveredAt.isAcceptableOrUnknown(
          data['delivered_at']!,
          _deliveredAtMeta,
        ),
      );
    }
    if (data.containsKey('delivery_attempts')) {
      context.handle(
        _deliveryAttemptsMeta,
        deliveryAttempts.isAcceptableOrUnknown(
          data['delivery_attempts']!,
          _deliveryAttemptsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoredNotificationQueueEntry map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredNotificationQueueEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      suggestionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}suggestion_id'],
      ),
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      quietHoursOverride: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}quiet_hours_override'],
      )!,
      scheduledFor: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_for'],
      )!,
      deliveredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}delivered_at'],
      ),
      deliveryAttempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}delivery_attempts'],
      )!,
    );
  }

  @override
  $NotificationQueueEntriesTable createAlias(String alias) {
    return $NotificationQueueEntriesTable(attachedDatabase, alias);
  }
}

class StoredNotificationQueueEntry extends DataClass
    implements Insertable<StoredNotificationQueueEntry> {
  final String id;
  final String userId;
  final String? suggestionId;
  final String channel;
  final int priority;
  final bool quietHoursOverride;
  final DateTime scheduledFor;
  final DateTime? deliveredAt;
  final int deliveryAttempts;
  const StoredNotificationQueueEntry({
    required this.id,
    required this.userId,
    this.suggestionId,
    required this.channel,
    required this.priority,
    required this.quietHoursOverride,
    required this.scheduledFor,
    this.deliveredAt,
    required this.deliveryAttempts,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || suggestionId != null) {
      map['suggestion_id'] = Variable<String>(suggestionId);
    }
    map['channel'] = Variable<String>(channel);
    map['priority'] = Variable<int>(priority);
    map['quiet_hours_override'] = Variable<bool>(quietHoursOverride);
    map['scheduled_for'] = Variable<DateTime>(scheduledFor);
    if (!nullToAbsent || deliveredAt != null) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt);
    }
    map['delivery_attempts'] = Variable<int>(deliveryAttempts);
    return map;
  }

  NotificationQueueEntriesCompanion toCompanion(bool nullToAbsent) {
    return NotificationQueueEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      suggestionId: suggestionId == null && nullToAbsent
          ? const Value.absent()
          : Value(suggestionId),
      channel: Value(channel),
      priority: Value(priority),
      quietHoursOverride: Value(quietHoursOverride),
      scheduledFor: Value(scheduledFor),
      deliveredAt: deliveredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveredAt),
      deliveryAttempts: Value(deliveryAttempts),
    );
  }

  factory StoredNotificationQueueEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredNotificationQueueEntry(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      suggestionId: serializer.fromJson<String?>(json['suggestionId']),
      channel: serializer.fromJson<String>(json['channel']),
      priority: serializer.fromJson<int>(json['priority']),
      quietHoursOverride: serializer.fromJson<bool>(json['quietHoursOverride']),
      scheduledFor: serializer.fromJson<DateTime>(json['scheduledFor']),
      deliveredAt: serializer.fromJson<DateTime?>(json['deliveredAt']),
      deliveryAttempts: serializer.fromJson<int>(json['deliveryAttempts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'suggestionId': serializer.toJson<String?>(suggestionId),
      'channel': serializer.toJson<String>(channel),
      'priority': serializer.toJson<int>(priority),
      'quietHoursOverride': serializer.toJson<bool>(quietHoursOverride),
      'scheduledFor': serializer.toJson<DateTime>(scheduledFor),
      'deliveredAt': serializer.toJson<DateTime?>(deliveredAt),
      'deliveryAttempts': serializer.toJson<int>(deliveryAttempts),
    };
  }

  StoredNotificationQueueEntry copyWith({
    String? id,
    String? userId,
    Value<String?> suggestionId = const Value.absent(),
    String? channel,
    int? priority,
    bool? quietHoursOverride,
    DateTime? scheduledFor,
    Value<DateTime?> deliveredAt = const Value.absent(),
    int? deliveryAttempts,
  }) => StoredNotificationQueueEntry(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    suggestionId: suggestionId.present ? suggestionId.value : this.suggestionId,
    channel: channel ?? this.channel,
    priority: priority ?? this.priority,
    quietHoursOverride: quietHoursOverride ?? this.quietHoursOverride,
    scheduledFor: scheduledFor ?? this.scheduledFor,
    deliveredAt: deliveredAt.present ? deliveredAt.value : this.deliveredAt,
    deliveryAttempts: deliveryAttempts ?? this.deliveryAttempts,
  );
  StoredNotificationQueueEntry copyWithCompanion(
    NotificationQueueEntriesCompanion data,
  ) {
    return StoredNotificationQueueEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      suggestionId: data.suggestionId.present
          ? data.suggestionId.value
          : this.suggestionId,
      channel: data.channel.present ? data.channel.value : this.channel,
      priority: data.priority.present ? data.priority.value : this.priority,
      quietHoursOverride: data.quietHoursOverride.present
          ? data.quietHoursOverride.value
          : this.quietHoursOverride,
      scheduledFor: data.scheduledFor.present
          ? data.scheduledFor.value
          : this.scheduledFor,
      deliveredAt: data.deliveredAt.present
          ? data.deliveredAt.value
          : this.deliveredAt,
      deliveryAttempts: data.deliveryAttempts.present
          ? data.deliveryAttempts.value
          : this.deliveryAttempts,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoredNotificationQueueEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('suggestionId: $suggestionId, ')
          ..write('channel: $channel, ')
          ..write('priority: $priority, ')
          ..write('quietHoursOverride: $quietHoursOverride, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('deliveredAt: $deliveredAt, ')
          ..write('deliveryAttempts: $deliveryAttempts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    suggestionId,
    channel,
    priority,
    quietHoursOverride,
    scheduledFor,
    deliveredAt,
    deliveryAttempts,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredNotificationQueueEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.suggestionId == this.suggestionId &&
          other.channel == this.channel &&
          other.priority == this.priority &&
          other.quietHoursOverride == this.quietHoursOverride &&
          other.scheduledFor == this.scheduledFor &&
          other.deliveredAt == this.deliveredAt &&
          other.deliveryAttempts == this.deliveryAttempts);
}

class NotificationQueueEntriesCompanion
    extends UpdateCompanion<StoredNotificationQueueEntry> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String?> suggestionId;
  final Value<String> channel;
  final Value<int> priority;
  final Value<bool> quietHoursOverride;
  final Value<DateTime> scheduledFor;
  final Value<DateTime?> deliveredAt;
  final Value<int> deliveryAttempts;
  final Value<int> rowid;
  const NotificationQueueEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.suggestionId = const Value.absent(),
    this.channel = const Value.absent(),
    this.priority = const Value.absent(),
    this.quietHoursOverride = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.deliveredAt = const Value.absent(),
    this.deliveryAttempts = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationQueueEntriesCompanion.insert({
    required String id,
    required String userId,
    this.suggestionId = const Value.absent(),
    required String channel,
    required int priority,
    this.quietHoursOverride = const Value.absent(),
    required DateTime scheduledFor,
    this.deliveredAt = const Value.absent(),
    this.deliveryAttempts = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       channel = Value(channel),
       priority = Value(priority),
       scheduledFor = Value(scheduledFor);
  static Insertable<StoredNotificationQueueEntry> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? suggestionId,
    Expression<String>? channel,
    Expression<int>? priority,
    Expression<bool>? quietHoursOverride,
    Expression<DateTime>? scheduledFor,
    Expression<DateTime>? deliveredAt,
    Expression<int>? deliveryAttempts,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (suggestionId != null) 'suggestion_id': suggestionId,
      if (channel != null) 'channel': channel,
      if (priority != null) 'priority': priority,
      if (quietHoursOverride != null)
        'quiet_hours_override': quietHoursOverride,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (deliveredAt != null) 'delivered_at': deliveredAt,
      if (deliveryAttempts != null) 'delivery_attempts': deliveryAttempts,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationQueueEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String?>? suggestionId,
    Value<String>? channel,
    Value<int>? priority,
    Value<bool>? quietHoursOverride,
    Value<DateTime>? scheduledFor,
    Value<DateTime?>? deliveredAt,
    Value<int>? deliveryAttempts,
    Value<int>? rowid,
  }) {
    return NotificationQueueEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      suggestionId: suggestionId ?? this.suggestionId,
      channel: channel ?? this.channel,
      priority: priority ?? this.priority,
      quietHoursOverride: quietHoursOverride ?? this.quietHoursOverride,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      deliveryAttempts: deliveryAttempts ?? this.deliveryAttempts,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (suggestionId.present) {
      map['suggestion_id'] = Variable<String>(suggestionId.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (quietHoursOverride.present) {
      map['quiet_hours_override'] = Variable<bool>(quietHoursOverride.value);
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor.value);
    }
    if (deliveredAt.present) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt.value);
    }
    if (deliveryAttempts.present) {
      map['delivery_attempts'] = Variable<int>(deliveryAttempts.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationQueueEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('suggestionId: $suggestionId, ')
          ..write('channel: $channel, ')
          ..write('priority: $priority, ')
          ..write('quietHoursOverride: $quietHoursOverride, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('deliveredAt: $deliveredAt, ')
          ..write('deliveryAttempts: $deliveryAttempts, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalStore extends GeneratedDatabase {
  _$LocalStore(QueryExecutor e) : super(e);
  $LocalStoreManager get managers => $LocalStoreManager(this);
  late final $ContextSignalEntriesTable contextSignalEntries =
      $ContextSignalEntriesTable(this);
  late final $AssistiveSuggestionEntriesTable assistiveSuggestionEntries =
      $AssistiveSuggestionEntriesTable(this);
  late final $ConsentAuditEntriesTable consentAuditEntries =
      $ConsentAuditEntriesTable(this);
  late final $NotificationQueueEntriesTable notificationQueueEntries =
      $NotificationQueueEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    contextSignalEntries,
    assistiveSuggestionEntries,
    consentAuditEntries,
    notificationQueueEntries,
  ];
}

typedef $$ContextSignalEntriesTableCreateCompanionBuilder =
    ContextSignalEntriesCompanion Function({
      required String id,
      required String userId,
      required int source,
      required String sourceIdentifier,
      required DateTime ingestedAt,
      required int priority,
      Value<DateTime?> expiresAt,
      required String permissionsScope,
      required String payloadDigest,
      Value<double?> confidenceHint,
      Value<int> rowid,
    });
typedef $$ContextSignalEntriesTableUpdateCompanionBuilder =
    ContextSignalEntriesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<int> source,
      Value<String> sourceIdentifier,
      Value<DateTime> ingestedAt,
      Value<int> priority,
      Value<DateTime?> expiresAt,
      Value<String> permissionsScope,
      Value<String> payloadDigest,
      Value<double?> confidenceHint,
      Value<int> rowid,
    });

class $$ContextSignalEntriesTableFilterComposer
    extends Composer<_$LocalStore, $ContextSignalEntriesTable> {
  $$ContextSignalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceIdentifier => $composableBuilder(
    column: $table.sourceIdentifier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ingestedAt => $composableBuilder(
    column: $table.ingestedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get permissionsScope => $composableBuilder(
    column: $table.permissionsScope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadDigest => $composableBuilder(
    column: $table.payloadDigest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidenceHint => $composableBuilder(
    column: $table.confidenceHint,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ContextSignalEntriesTableOrderingComposer
    extends Composer<_$LocalStore, $ContextSignalEntriesTable> {
  $$ContextSignalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceIdentifier => $composableBuilder(
    column: $table.sourceIdentifier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get ingestedAt => $composableBuilder(
    column: $table.ingestedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get permissionsScope => $composableBuilder(
    column: $table.permissionsScope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadDigest => $composableBuilder(
    column: $table.payloadDigest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidenceHint => $composableBuilder(
    column: $table.confidenceHint,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContextSignalEntriesTableAnnotationComposer
    extends Composer<_$LocalStore, $ContextSignalEntriesTable> {
  $$ContextSignalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get sourceIdentifier => $composableBuilder(
    column: $table.sourceIdentifier,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get ingestedAt => $composableBuilder(
    column: $table.ingestedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<String> get permissionsScope => $composableBuilder(
    column: $table.permissionsScope,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payloadDigest => $composableBuilder(
    column: $table.payloadDigest,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidenceHint => $composableBuilder(
    column: $table.confidenceHint,
    builder: (column) => column,
  );
}

class $$ContextSignalEntriesTableTableManager
    extends
        RootTableManager<
          _$LocalStore,
          $ContextSignalEntriesTable,
          ContextSignalEntry,
          $$ContextSignalEntriesTableFilterComposer,
          $$ContextSignalEntriesTableOrderingComposer,
          $$ContextSignalEntriesTableAnnotationComposer,
          $$ContextSignalEntriesTableCreateCompanionBuilder,
          $$ContextSignalEntriesTableUpdateCompanionBuilder,
          (
            ContextSignalEntry,
            BaseReferences<
              _$LocalStore,
              $ContextSignalEntriesTable,
              ContextSignalEntry
            >,
          ),
          ContextSignalEntry,
          PrefetchHooks Function()
        > {
  $$ContextSignalEntriesTableTableManager(
    _$LocalStore db,
    $ContextSignalEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContextSignalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContextSignalEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ContextSignalEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int> source = const Value.absent(),
                Value<String> sourceIdentifier = const Value.absent(),
                Value<DateTime> ingestedAt = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<String> permissionsScope = const Value.absent(),
                Value<String> payloadDigest = const Value.absent(),
                Value<double?> confidenceHint = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContextSignalEntriesCompanion(
                id: id,
                userId: userId,
                source: source,
                sourceIdentifier: sourceIdentifier,
                ingestedAt: ingestedAt,
                priority: priority,
                expiresAt: expiresAt,
                permissionsScope: permissionsScope,
                payloadDigest: payloadDigest,
                confidenceHint: confidenceHint,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required int source,
                required String sourceIdentifier,
                required DateTime ingestedAt,
                required int priority,
                Value<DateTime?> expiresAt = const Value.absent(),
                required String permissionsScope,
                required String payloadDigest,
                Value<double?> confidenceHint = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContextSignalEntriesCompanion.insert(
                id: id,
                userId: userId,
                source: source,
                sourceIdentifier: sourceIdentifier,
                ingestedAt: ingestedAt,
                priority: priority,
                expiresAt: expiresAt,
                permissionsScope: permissionsScope,
                payloadDigest: payloadDigest,
                confidenceHint: confidenceHint,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ContextSignalEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStore,
      $ContextSignalEntriesTable,
      ContextSignalEntry,
      $$ContextSignalEntriesTableFilterComposer,
      $$ContextSignalEntriesTableOrderingComposer,
      $$ContextSignalEntriesTableAnnotationComposer,
      $$ContextSignalEntriesTableCreateCompanionBuilder,
      $$ContextSignalEntriesTableUpdateCompanionBuilder,
      (
        ContextSignalEntry,
        BaseReferences<
          _$LocalStore,
          $ContextSignalEntriesTable,
          ContextSignalEntry
        >,
      ),
      ContextSignalEntry,
      PrefetchHooks Function()
    >;
typedef $$AssistiveSuggestionEntriesTableCreateCompanionBuilder =
    AssistiveSuggestionEntriesCompanion Function({
      required String id,
      required String userId,
      required String triggerContextIds,
      required DateTime generatedAt,
      required int type,
      required String message,
      required String explanation,
      required double confidenceScore,
      required int status,
      Value<String?> feedbackNote,
      Value<DateTime?> respondedAt,
      Value<String> actionsJson,
      Value<String> boundaryChecksJson,
      Value<bool> boundaryViolationFlag,
      Value<int> rowid,
    });
typedef $$AssistiveSuggestionEntriesTableUpdateCompanionBuilder =
    AssistiveSuggestionEntriesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> triggerContextIds,
      Value<DateTime> generatedAt,
      Value<int> type,
      Value<String> message,
      Value<String> explanation,
      Value<double> confidenceScore,
      Value<int> status,
      Value<String?> feedbackNote,
      Value<DateTime?> respondedAt,
      Value<String> actionsJson,
      Value<String> boundaryChecksJson,
      Value<bool> boundaryViolationFlag,
      Value<int> rowid,
    });

class $$AssistiveSuggestionEntriesTableFilterComposer
    extends Composer<_$LocalStore, $AssistiveSuggestionEntriesTable> {
  $$AssistiveSuggestionEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get triggerContextIds => $composableBuilder(
    column: $table.triggerContextIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidenceScore => $composableBuilder(
    column: $table.confidenceScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feedbackNote => $composableBuilder(
    column: $table.feedbackNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get respondedAt => $composableBuilder(
    column: $table.respondedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionsJson => $composableBuilder(
    column: $table.actionsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get boundaryChecksJson => $composableBuilder(
    column: $table.boundaryChecksJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get boundaryViolationFlag => $composableBuilder(
    column: $table.boundaryViolationFlag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AssistiveSuggestionEntriesTableOrderingComposer
    extends Composer<_$LocalStore, $AssistiveSuggestionEntriesTable> {
  $$AssistiveSuggestionEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggerContextIds => $composableBuilder(
    column: $table.triggerContextIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidenceScore => $composableBuilder(
    column: $table.confidenceScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feedbackNote => $composableBuilder(
    column: $table.feedbackNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get respondedAt => $composableBuilder(
    column: $table.respondedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionsJson => $composableBuilder(
    column: $table.actionsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get boundaryChecksJson => $composableBuilder(
    column: $table.boundaryChecksJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get boundaryViolationFlag => $composableBuilder(
    column: $table.boundaryViolationFlag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AssistiveSuggestionEntriesTableAnnotationComposer
    extends Composer<_$LocalStore, $AssistiveSuggestionEntriesTable> {
  $$AssistiveSuggestionEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get triggerContextIds => $composableBuilder(
    column: $table.triggerContextIds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidenceScore => $composableBuilder(
    column: $table.confidenceScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get feedbackNote => $composableBuilder(
    column: $table.feedbackNote,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get respondedAt => $composableBuilder(
    column: $table.respondedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actionsJson => $composableBuilder(
    column: $table.actionsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get boundaryChecksJson => $composableBuilder(
    column: $table.boundaryChecksJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get boundaryViolationFlag => $composableBuilder(
    column: $table.boundaryViolationFlag,
    builder: (column) => column,
  );
}

class $$AssistiveSuggestionEntriesTableTableManager
    extends
        RootTableManager<
          _$LocalStore,
          $AssistiveSuggestionEntriesTable,
          AssistiveSuggestionEntry,
          $$AssistiveSuggestionEntriesTableFilterComposer,
          $$AssistiveSuggestionEntriesTableOrderingComposer,
          $$AssistiveSuggestionEntriesTableAnnotationComposer,
          $$AssistiveSuggestionEntriesTableCreateCompanionBuilder,
          $$AssistiveSuggestionEntriesTableUpdateCompanionBuilder,
          (
            AssistiveSuggestionEntry,
            BaseReferences<
              _$LocalStore,
              $AssistiveSuggestionEntriesTable,
              AssistiveSuggestionEntry
            >,
          ),
          AssistiveSuggestionEntry,
          PrefetchHooks Function()
        > {
  $$AssistiveSuggestionEntriesTableTableManager(
    _$LocalStore db,
    $AssistiveSuggestionEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssistiveSuggestionEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AssistiveSuggestionEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AssistiveSuggestionEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> triggerContextIds = const Value.absent(),
                Value<DateTime> generatedAt = const Value.absent(),
                Value<int> type = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String> explanation = const Value.absent(),
                Value<double> confidenceScore = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> feedbackNote = const Value.absent(),
                Value<DateTime?> respondedAt = const Value.absent(),
                Value<String> actionsJson = const Value.absent(),
                Value<String> boundaryChecksJson = const Value.absent(),
                Value<bool> boundaryViolationFlag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssistiveSuggestionEntriesCompanion(
                id: id,
                userId: userId,
                triggerContextIds: triggerContextIds,
                generatedAt: generatedAt,
                type: type,
                message: message,
                explanation: explanation,
                confidenceScore: confidenceScore,
                status: status,
                feedbackNote: feedbackNote,
                respondedAt: respondedAt,
                actionsJson: actionsJson,
                boundaryChecksJson: boundaryChecksJson,
                boundaryViolationFlag: boundaryViolationFlag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String triggerContextIds,
                required DateTime generatedAt,
                required int type,
                required String message,
                required String explanation,
                required double confidenceScore,
                required int status,
                Value<String?> feedbackNote = const Value.absent(),
                Value<DateTime?> respondedAt = const Value.absent(),
                Value<String> actionsJson = const Value.absent(),
                Value<String> boundaryChecksJson = const Value.absent(),
                Value<bool> boundaryViolationFlag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssistiveSuggestionEntriesCompanion.insert(
                id: id,
                userId: userId,
                triggerContextIds: triggerContextIds,
                generatedAt: generatedAt,
                type: type,
                message: message,
                explanation: explanation,
                confidenceScore: confidenceScore,
                status: status,
                feedbackNote: feedbackNote,
                respondedAt: respondedAt,
                actionsJson: actionsJson,
                boundaryChecksJson: boundaryChecksJson,
                boundaryViolationFlag: boundaryViolationFlag,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AssistiveSuggestionEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStore,
      $AssistiveSuggestionEntriesTable,
      AssistiveSuggestionEntry,
      $$AssistiveSuggestionEntriesTableFilterComposer,
      $$AssistiveSuggestionEntriesTableOrderingComposer,
      $$AssistiveSuggestionEntriesTableAnnotationComposer,
      $$AssistiveSuggestionEntriesTableCreateCompanionBuilder,
      $$AssistiveSuggestionEntriesTableUpdateCompanionBuilder,
      (
        AssistiveSuggestionEntry,
        BaseReferences<
          _$LocalStore,
          $AssistiveSuggestionEntriesTable,
          AssistiveSuggestionEntry
        >,
      ),
      AssistiveSuggestionEntry,
      PrefetchHooks Function()
    >;
typedef $$ConsentAuditEntriesTableCreateCompanionBuilder =
    ConsentAuditEntriesCompanion Function({
      Value<int> id,
      required String userId,
      required String eventType,
      required String scope,
      required DateTime occurredAt,
      required String actor,
      Value<String?> notes,
    });
typedef $$ConsentAuditEntriesTableUpdateCompanionBuilder =
    ConsentAuditEntriesCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> eventType,
      Value<String> scope,
      Value<DateTime> occurredAt,
      Value<String> actor,
      Value<String?> notes,
    });

class $$ConsentAuditEntriesTableFilterComposer
    extends Composer<_$LocalStore, $ConsentAuditEntriesTable> {
  $$ConsentAuditEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actor => $composableBuilder(
    column: $table.actor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConsentAuditEntriesTableOrderingComposer
    extends Composer<_$LocalStore, $ConsentAuditEntriesTable> {
  $$ConsentAuditEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actor => $composableBuilder(
    column: $table.actor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConsentAuditEntriesTableAnnotationComposer
    extends Composer<_$LocalStore, $ConsentAuditEntriesTable> {
  $$ConsentAuditEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actor =>
      $composableBuilder(column: $table.actor, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ConsentAuditEntriesTableTableManager
    extends
        RootTableManager<
          _$LocalStore,
          $ConsentAuditEntriesTable,
          StoredConsentAuditEntry,
          $$ConsentAuditEntriesTableFilterComposer,
          $$ConsentAuditEntriesTableOrderingComposer,
          $$ConsentAuditEntriesTableAnnotationComposer,
          $$ConsentAuditEntriesTableCreateCompanionBuilder,
          $$ConsentAuditEntriesTableUpdateCompanionBuilder,
          (
            StoredConsentAuditEntry,
            BaseReferences<
              _$LocalStore,
              $ConsentAuditEntriesTable,
              StoredConsentAuditEntry
            >,
          ),
          StoredConsentAuditEntry,
          PrefetchHooks Function()
        > {
  $$ConsentAuditEntriesTableTableManager(
    _$LocalStore db,
    $ConsentAuditEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConsentAuditEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConsentAuditEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ConsentAuditEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<String> scope = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<String> actor = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => ConsentAuditEntriesCompanion(
                id: id,
                userId: userId,
                eventType: eventType,
                scope: scope,
                occurredAt: occurredAt,
                actor: actor,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String eventType,
                required String scope,
                required DateTime occurredAt,
                required String actor,
                Value<String?> notes = const Value.absent(),
              }) => ConsentAuditEntriesCompanion.insert(
                id: id,
                userId: userId,
                eventType: eventType,
                scope: scope,
                occurredAt: occurredAt,
                actor: actor,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConsentAuditEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStore,
      $ConsentAuditEntriesTable,
      StoredConsentAuditEntry,
      $$ConsentAuditEntriesTableFilterComposer,
      $$ConsentAuditEntriesTableOrderingComposer,
      $$ConsentAuditEntriesTableAnnotationComposer,
      $$ConsentAuditEntriesTableCreateCompanionBuilder,
      $$ConsentAuditEntriesTableUpdateCompanionBuilder,
      (
        StoredConsentAuditEntry,
        BaseReferences<
          _$LocalStore,
          $ConsentAuditEntriesTable,
          StoredConsentAuditEntry
        >,
      ),
      StoredConsentAuditEntry,
      PrefetchHooks Function()
    >;
typedef $$NotificationQueueEntriesTableCreateCompanionBuilder =
    NotificationQueueEntriesCompanion Function({
      required String id,
      required String userId,
      Value<String?> suggestionId,
      required String channel,
      required int priority,
      Value<bool> quietHoursOverride,
      required DateTime scheduledFor,
      Value<DateTime?> deliveredAt,
      Value<int> deliveryAttempts,
      Value<int> rowid,
    });
typedef $$NotificationQueueEntriesTableUpdateCompanionBuilder =
    NotificationQueueEntriesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String?> suggestionId,
      Value<String> channel,
      Value<int> priority,
      Value<bool> quietHoursOverride,
      Value<DateTime> scheduledFor,
      Value<DateTime?> deliveredAt,
      Value<int> deliveryAttempts,
      Value<int> rowid,
    });

class $$NotificationQueueEntriesTableFilterComposer
    extends Composer<_$LocalStore, $NotificationQueueEntriesTable> {
  $$NotificationQueueEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get suggestionId => $composableBuilder(
    column: $table.suggestionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get quietHoursOverride => $composableBuilder(
    column: $table.quietHoursOverride,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deliveredAt => $composableBuilder(
    column: $table.deliveredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deliveryAttempts => $composableBuilder(
    column: $table.deliveryAttempts,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationQueueEntriesTableOrderingComposer
    extends Composer<_$LocalStore, $NotificationQueueEntriesTable> {
  $$NotificationQueueEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get suggestionId => $composableBuilder(
    column: $table.suggestionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get quietHoursOverride => $composableBuilder(
    column: $table.quietHoursOverride,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deliveredAt => $composableBuilder(
    column: $table.deliveredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deliveryAttempts => $composableBuilder(
    column: $table.deliveryAttempts,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationQueueEntriesTableAnnotationComposer
    extends Composer<_$LocalStore, $NotificationQueueEntriesTable> {
  $$NotificationQueueEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get suggestionId => $composableBuilder(
    column: $table.suggestionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<bool> get quietHoursOverride => $composableBuilder(
    column: $table.quietHoursOverride,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deliveredAt => $composableBuilder(
    column: $table.deliveredAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deliveryAttempts => $composableBuilder(
    column: $table.deliveryAttempts,
    builder: (column) => column,
  );
}

class $$NotificationQueueEntriesTableTableManager
    extends
        RootTableManager<
          _$LocalStore,
          $NotificationQueueEntriesTable,
          StoredNotificationQueueEntry,
          $$NotificationQueueEntriesTableFilterComposer,
          $$NotificationQueueEntriesTableOrderingComposer,
          $$NotificationQueueEntriesTableAnnotationComposer,
          $$NotificationQueueEntriesTableCreateCompanionBuilder,
          $$NotificationQueueEntriesTableUpdateCompanionBuilder,
          (
            StoredNotificationQueueEntry,
            BaseReferences<
              _$LocalStore,
              $NotificationQueueEntriesTable,
              StoredNotificationQueueEntry
            >,
          ),
          StoredNotificationQueueEntry,
          PrefetchHooks Function()
        > {
  $$NotificationQueueEntriesTableTableManager(
    _$LocalStore db,
    $NotificationQueueEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationQueueEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$NotificationQueueEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationQueueEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> suggestionId = const Value.absent(),
                Value<String> channel = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<bool> quietHoursOverride = const Value.absent(),
                Value<DateTime> scheduledFor = const Value.absent(),
                Value<DateTime?> deliveredAt = const Value.absent(),
                Value<int> deliveryAttempts = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationQueueEntriesCompanion(
                id: id,
                userId: userId,
                suggestionId: suggestionId,
                channel: channel,
                priority: priority,
                quietHoursOverride: quietHoursOverride,
                scheduledFor: scheduledFor,
                deliveredAt: deliveredAt,
                deliveryAttempts: deliveryAttempts,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                Value<String?> suggestionId = const Value.absent(),
                required String channel,
                required int priority,
                Value<bool> quietHoursOverride = const Value.absent(),
                required DateTime scheduledFor,
                Value<DateTime?> deliveredAt = const Value.absent(),
                Value<int> deliveryAttempts = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationQueueEntriesCompanion.insert(
                id: id,
                userId: userId,
                suggestionId: suggestionId,
                channel: channel,
                priority: priority,
                quietHoursOverride: quietHoursOverride,
                scheduledFor: scheduledFor,
                deliveredAt: deliveredAt,
                deliveryAttempts: deliveryAttempts,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationQueueEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalStore,
      $NotificationQueueEntriesTable,
      StoredNotificationQueueEntry,
      $$NotificationQueueEntriesTableFilterComposer,
      $$NotificationQueueEntriesTableOrderingComposer,
      $$NotificationQueueEntriesTableAnnotationComposer,
      $$NotificationQueueEntriesTableCreateCompanionBuilder,
      $$NotificationQueueEntriesTableUpdateCompanionBuilder,
      (
        StoredNotificationQueueEntry,
        BaseReferences<
          _$LocalStore,
          $NotificationQueueEntriesTable,
          StoredNotificationQueueEntry
        >,
      ),
      StoredNotificationQueueEntry,
      PrefetchHooks Function()
    >;

class $LocalStoreManager {
  final _$LocalStore _db;
  $LocalStoreManager(this._db);
  $$ContextSignalEntriesTableTableManager get contextSignalEntries =>
      $$ContextSignalEntriesTableTableManager(_db, _db.contextSignalEntries);
  $$AssistiveSuggestionEntriesTableTableManager
  get assistiveSuggestionEntries =>
      $$AssistiveSuggestionEntriesTableTableManager(
        _db,
        _db.assistiveSuggestionEntries,
      );
  $$ConsentAuditEntriesTableTableManager get consentAuditEntries =>
      $$ConsentAuditEntriesTableTableManager(_db, _db.consentAuditEntries);
  $$NotificationQueueEntriesTableTableManager get notificationQueueEntries =>
      $$NotificationQueueEntriesTableTableManager(
        _db,
        _db.notificationQueueEntries,
      );
}
