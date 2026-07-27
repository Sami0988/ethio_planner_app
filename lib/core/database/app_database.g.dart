// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ecDateMeta = const VerificationMeta('ecDate');
  @override
  late final GeneratedColumn<DateTime> ecDate = GeneratedColumn<DateTime>(
    'ec_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gcDateMeta = const VerificationMeta('gcDate');
  @override
  late final GeneratedColumn<DateTime> gcDate = GeneratedColumn<DateTime>(
    'gc_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isAllDayMeta = const VerificationMeta(
    'isAllDay',
  );
  @override
  late final GeneratedColumn<bool> isAllDay = GeneratedColumn<bool>(
    'is_all_day',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_all_day" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recurrenceRuleMeta = const VerificationMeta(
    'recurrenceRule',
  );
  @override
  late final GeneratedColumn<String> recurrenceRule = GeneratedColumn<String>(
    'recurrence_rule',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverVersionMeta = const VerificationMeta(
    'serverVersion',
  );
  @override
  late final GeneratedColumn<int> serverVersion = GeneratedColumn<int>(
    'server_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _lastOperationIdMeta = const VerificationMeta(
    'lastOperationId',
  );
  @override
  late final GeneratedColumn<String> lastOperationId = GeneratedColumn<String>(
    'last_operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    ecDate,
    gcDate,
    description,
    isAllDay,
    category,
    location,
    recurrenceRule,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('ec_date')) {
      context.handle(
        _ecDateMeta,
        ecDate.isAcceptableOrUnknown(data['ec_date']!, _ecDateMeta),
      );
    } else if (isInserting) {
      context.missing(_ecDateMeta);
    }
    if (data.containsKey('gc_date')) {
      context.handle(
        _gcDateMeta,
        gcDate.isAcceptableOrUnknown(data['gc_date']!, _gcDateMeta),
      );
    } else if (isInserting) {
      context.missing(_gcDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_all_day')) {
      context.handle(
        _isAllDayMeta,
        isAllDay.isAcceptableOrUnknown(data['is_all_day']!, _isAllDayMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('recurrence_rule')) {
      context.handle(
        _recurrenceRuleMeta,
        recurrenceRule.isAcceptableOrUnknown(
          data['recurrence_rule']!,
          _recurrenceRuleMeta,
        ),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('server_version')) {
      context.handle(
        _serverVersionMeta,
        serverVersion.isAcceptableOrUnknown(
          data['server_version']!,
          _serverVersionMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_operation_id')) {
      context.handle(
        _lastOperationIdMeta,
        lastOperationId.isAcceptableOrUnknown(
          data['last_operation_id']!,
          _lastOperationIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      ecDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ec_date'],
      )!,
      gcDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}gc_date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isAllDay: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_all_day'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      recurrenceRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence_rule'],
      ),
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      serverVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_version'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastOperationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_operation_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }
}

class CalendarEvent extends DataClass implements Insertable<CalendarEvent> {
  final String id;
  final String title;
  final DateTime ecDate;
  final DateTime gcDate;
  final String? description;
  final bool isAllDay;
  final String? category;
  final String? location;
  final String? recurrenceRule;
  final String? accountId;
  final int serverVersion;
  final String syncStatus;
  final String? lastOperationId;
  final DateTime? deletedAt;
  const CalendarEvent({
    required this.id,
    required this.title,
    required this.ecDate,
    required this.gcDate,
    this.description,
    required this.isAllDay,
    this.category,
    this.location,
    this.recurrenceRule,
    this.accountId,
    required this.serverVersion,
    required this.syncStatus,
    this.lastOperationId,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['ec_date'] = Variable<DateTime>(ecDate);
    map['gc_date'] = Variable<DateTime>(gcDate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_all_day'] = Variable<bool>(isAllDay);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || recurrenceRule != null) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule);
    }
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    map['server_version'] = Variable<int>(serverVersion);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastOperationId != null) {
      map['last_operation_id'] = Variable<String>(lastOperationId);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      title: Value(title),
      ecDate: Value(ecDate),
      gcDate: Value(gcDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isAllDay: Value(isAllDay),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      recurrenceRule: recurrenceRule == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceRule),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      serverVersion: Value(serverVersion),
      syncStatus: Value(syncStatus),
      lastOperationId: lastOperationId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastOperationId),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CalendarEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEvent(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      ecDate: serializer.fromJson<DateTime>(json['ecDate']),
      gcDate: serializer.fromJson<DateTime>(json['gcDate']),
      description: serializer.fromJson<String?>(json['description']),
      isAllDay: serializer.fromJson<bool>(json['isAllDay']),
      category: serializer.fromJson<String?>(json['category']),
      location: serializer.fromJson<String?>(json['location']),
      recurrenceRule: serializer.fromJson<String?>(json['recurrenceRule']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      serverVersion: serializer.fromJson<int>(json['serverVersion']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastOperationId: serializer.fromJson<String?>(json['lastOperationId']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'ecDate': serializer.toJson<DateTime>(ecDate),
      'gcDate': serializer.toJson<DateTime>(gcDate),
      'description': serializer.toJson<String?>(description),
      'isAllDay': serializer.toJson<bool>(isAllDay),
      'category': serializer.toJson<String?>(category),
      'location': serializer.toJson<String?>(location),
      'recurrenceRule': serializer.toJson<String?>(recurrenceRule),
      'accountId': serializer.toJson<String?>(accountId),
      'serverVersion': serializer.toJson<int>(serverVersion),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastOperationId': serializer.toJson<String?>(lastOperationId),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CalendarEvent copyWith({
    String? id,
    String? title,
    DateTime? ecDate,
    DateTime? gcDate,
    Value<String?> description = const Value.absent(),
    bool? isAllDay,
    Value<String?> category = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> recurrenceRule = const Value.absent(),
    Value<String?> accountId = const Value.absent(),
    int? serverVersion,
    String? syncStatus,
    Value<String?> lastOperationId = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => CalendarEvent(
    id: id ?? this.id,
    title: title ?? this.title,
    ecDate: ecDate ?? this.ecDate,
    gcDate: gcDate ?? this.gcDate,
    description: description.present ? description.value : this.description,
    isAllDay: isAllDay ?? this.isAllDay,
    category: category.present ? category.value : this.category,
    location: location.present ? location.value : this.location,
    recurrenceRule: recurrenceRule.present
        ? recurrenceRule.value
        : this.recurrenceRule,
    accountId: accountId.present ? accountId.value : this.accountId,
    serverVersion: serverVersion ?? this.serverVersion,
    syncStatus: syncStatus ?? this.syncStatus,
    lastOperationId: lastOperationId.present
        ? lastOperationId.value
        : this.lastOperationId,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  CalendarEvent copyWithCompanion(CalendarEventsCompanion data) {
    return CalendarEvent(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      ecDate: data.ecDate.present ? data.ecDate.value : this.ecDate,
      gcDate: data.gcDate.present ? data.gcDate.value : this.gcDate,
      description: data.description.present
          ? data.description.value
          : this.description,
      isAllDay: data.isAllDay.present ? data.isAllDay.value : this.isAllDay,
      category: data.category.present ? data.category.value : this.category,
      location: data.location.present ? data.location.value : this.location,
      recurrenceRule: data.recurrenceRule.present
          ? data.recurrenceRule.value
          : this.recurrenceRule,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastOperationId: data.lastOperationId.present
          ? data.lastOperationId.value
          : this.lastOperationId,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEvent(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ecDate: $ecDate, ')
          ..write('gcDate: $gcDate, ')
          ..write('description: $description, ')
          ..write('isAllDay: $isAllDay, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    ecDate,
    gcDate,
    description,
    isAllDay,
    category,
    location,
    recurrenceRule,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEvent &&
          other.id == this.id &&
          other.title == this.title &&
          other.ecDate == this.ecDate &&
          other.gcDate == this.gcDate &&
          other.description == this.description &&
          other.isAllDay == this.isAllDay &&
          other.category == this.category &&
          other.location == this.location &&
          other.recurrenceRule == this.recurrenceRule &&
          other.accountId == this.accountId &&
          other.serverVersion == this.serverVersion &&
          other.syncStatus == this.syncStatus &&
          other.lastOperationId == this.lastOperationId &&
          other.deletedAt == this.deletedAt);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEvent> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> ecDate;
  final Value<DateTime> gcDate;
  final Value<String?> description;
  final Value<bool> isAllDay;
  final Value<String?> category;
  final Value<String?> location;
  final Value<String?> recurrenceRule;
  final Value<String?> accountId;
  final Value<int> serverVersion;
  final Value<String> syncStatus;
  final Value<String?> lastOperationId;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.ecDate = const Value.absent(),
    this.gcDate = const Value.absent(),
    this.description = const Value.absent(),
    this.isAllDay = const Value.absent(),
    this.category = const Value.absent(),
    this.location = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    this.description = const Value.absent(),
    this.isAllDay = const Value.absent(),
    this.category = const Value.absent(),
    this.location = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       ecDate = Value(ecDate),
       gcDate = Value(gcDate);
  static Insertable<CalendarEvent> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? ecDate,
    Expression<DateTime>? gcDate,
    Expression<String>? description,
    Expression<bool>? isAllDay,
    Expression<String>? category,
    Expression<String>? location,
    Expression<String>? recurrenceRule,
    Expression<String>? accountId,
    Expression<int>? serverVersion,
    Expression<String>? syncStatus,
    Expression<String>? lastOperationId,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (ecDate != null) 'ec_date': ecDate,
      if (gcDate != null) 'gc_date': gcDate,
      if (description != null) 'description': description,
      if (isAllDay != null) 'is_all_day': isAllDay,
      if (category != null) 'category': category,
      if (location != null) 'location': location,
      if (recurrenceRule != null) 'recurrence_rule': recurrenceRule,
      if (accountId != null) 'account_id': accountId,
      if (serverVersion != null) 'server_version': serverVersion,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastOperationId != null) 'last_operation_id': lastOperationId,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<DateTime>? ecDate,
    Value<DateTime>? gcDate,
    Value<String?>? description,
    Value<bool>? isAllDay,
    Value<String?>? category,
    Value<String?>? location,
    Value<String?>? recurrenceRule,
    Value<String?>? accountId,
    Value<int>? serverVersion,
    Value<String>? syncStatus,
    Value<String?>? lastOperationId,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      ecDate: ecDate ?? this.ecDate,
      gcDate: gcDate ?? this.gcDate,
      description: description ?? this.description,
      isAllDay: isAllDay ?? this.isAllDay,
      category: category ?? this.category,
      location: location ?? this.location,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
      accountId: accountId ?? this.accountId,
      serverVersion: serverVersion ?? this.serverVersion,
      syncStatus: syncStatus ?? this.syncStatus,
      lastOperationId: lastOperationId ?? this.lastOperationId,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (ecDate.present) {
      map['ec_date'] = Variable<DateTime>(ecDate.value);
    }
    if (gcDate.present) {
      map['gc_date'] = Variable<DateTime>(gcDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isAllDay.present) {
      map['is_all_day'] = Variable<bool>(isAllDay.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (recurrenceRule.present) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (serverVersion.present) {
      map['server_version'] = Variable<int>(serverVersion.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastOperationId.present) {
      map['last_operation_id'] = Variable<String>(lastOperationId.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ecDate: $ecDate, ')
          ..write('gcDate: $gcDate, ')
          ..write('description: $description, ')
          ..write('isAllDay: $isAllDay, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlannerItemsTable extends PlannerItems
    with TableInfo<$PlannerItemsTable, PlannerItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlannerItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ecDateMeta = const VerificationMeta('ecDate');
  @override
  late final GeneratedColumn<DateTime> ecDate = GeneratedColumn<DateTime>(
    'ec_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gcDateMeta = const VerificationMeta('gcDate');
  @override
  late final GeneratedColumn<DateTime> gcDate = GeneratedColumn<DateTime>(
    'gc_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sectionMeta = const VerificationMeta(
    'section',
  );
  @override
  late final GeneratedColumn<String> section = GeneratedColumn<String>(
    'section',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('focus'),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _linkedEventIdMeta = const VerificationMeta(
    'linkedEventId',
  );
  @override
  late final GeneratedColumn<String> linkedEventId = GeneratedColumn<String>(
    'linked_event_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _linkedReminderIdMeta = const VerificationMeta(
    'linkedReminderId',
  );
  @override
  late final GeneratedColumn<String> linkedReminderId = GeneratedColumn<String>(
    'linked_reminder_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverVersionMeta = const VerificationMeta(
    'serverVersion',
  );
  @override
  late final GeneratedColumn<int> serverVersion = GeneratedColumn<int>(
    'server_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _lastOperationIdMeta = const VerificationMeta(
    'lastOperationId',
  );
  @override
  late final GeneratedColumn<String> lastOperationId = GeneratedColumn<String>(
    'last_operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    ecDate,
    gcDate,
    description,
    isCompleted,
    section,
    sortOrder,
    linkedEventId,
    linkedReminderId,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'planner_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlannerItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('ec_date')) {
      context.handle(
        _ecDateMeta,
        ecDate.isAcceptableOrUnknown(data['ec_date']!, _ecDateMeta),
      );
    } else if (isInserting) {
      context.missing(_ecDateMeta);
    }
    if (data.containsKey('gc_date')) {
      context.handle(
        _gcDateMeta,
        gcDate.isAcceptableOrUnknown(data['gc_date']!, _gcDateMeta),
      );
    } else if (isInserting) {
      context.missing(_gcDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('section')) {
      context.handle(
        _sectionMeta,
        section.isAcceptableOrUnknown(data['section']!, _sectionMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('linked_event_id')) {
      context.handle(
        _linkedEventIdMeta,
        linkedEventId.isAcceptableOrUnknown(
          data['linked_event_id']!,
          _linkedEventIdMeta,
        ),
      );
    }
    if (data.containsKey('linked_reminder_id')) {
      context.handle(
        _linkedReminderIdMeta,
        linkedReminderId.isAcceptableOrUnknown(
          data['linked_reminder_id']!,
          _linkedReminderIdMeta,
        ),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('server_version')) {
      context.handle(
        _serverVersionMeta,
        serverVersion.isAcceptableOrUnknown(
          data['server_version']!,
          _serverVersionMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_operation_id')) {
      context.handle(
        _lastOperationIdMeta,
        lastOperationId.isAcceptableOrUnknown(
          data['last_operation_id']!,
          _lastOperationIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlannerItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannerItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      ecDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ec_date'],
      )!,
      gcDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}gc_date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      section: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      linkedEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_event_id'],
      ),
      linkedReminderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_reminder_id'],
      ),
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      serverVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_version'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastOperationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_operation_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $PlannerItemsTable createAlias(String alias) {
    return $PlannerItemsTable(attachedDatabase, alias);
  }
}

class PlannerItem extends DataClass implements Insertable<PlannerItem> {
  final String id;
  final String title;
  final DateTime ecDate;
  final DateTime gcDate;
  final String? description;
  final bool isCompleted;
  final String section;
  final int sortOrder;
  final String? linkedEventId;
  final String? linkedReminderId;
  final String? accountId;
  final int serverVersion;
  final String syncStatus;
  final String? lastOperationId;
  final DateTime? deletedAt;
  const PlannerItem({
    required this.id,
    required this.title,
    required this.ecDate,
    required this.gcDate,
    this.description,
    required this.isCompleted,
    required this.section,
    required this.sortOrder,
    this.linkedEventId,
    this.linkedReminderId,
    this.accountId,
    required this.serverVersion,
    required this.syncStatus,
    this.lastOperationId,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['ec_date'] = Variable<DateTime>(ecDate);
    map['gc_date'] = Variable<DateTime>(gcDate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    map['section'] = Variable<String>(section);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || linkedEventId != null) {
      map['linked_event_id'] = Variable<String>(linkedEventId);
    }
    if (!nullToAbsent || linkedReminderId != null) {
      map['linked_reminder_id'] = Variable<String>(linkedReminderId);
    }
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    map['server_version'] = Variable<int>(serverVersion);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastOperationId != null) {
      map['last_operation_id'] = Variable<String>(lastOperationId);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  PlannerItemsCompanion toCompanion(bool nullToAbsent) {
    return PlannerItemsCompanion(
      id: Value(id),
      title: Value(title),
      ecDate: Value(ecDate),
      gcDate: Value(gcDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isCompleted: Value(isCompleted),
      section: Value(section),
      sortOrder: Value(sortOrder),
      linkedEventId: linkedEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedEventId),
      linkedReminderId: linkedReminderId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedReminderId),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      serverVersion: Value(serverVersion),
      syncStatus: Value(syncStatus),
      lastOperationId: lastOperationId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastOperationId),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory PlannerItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlannerItem(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      ecDate: serializer.fromJson<DateTime>(json['ecDate']),
      gcDate: serializer.fromJson<DateTime>(json['gcDate']),
      description: serializer.fromJson<String?>(json['description']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      section: serializer.fromJson<String>(json['section']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      linkedEventId: serializer.fromJson<String?>(json['linkedEventId']),
      linkedReminderId: serializer.fromJson<String?>(json['linkedReminderId']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      serverVersion: serializer.fromJson<int>(json['serverVersion']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastOperationId: serializer.fromJson<String?>(json['lastOperationId']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'ecDate': serializer.toJson<DateTime>(ecDate),
      'gcDate': serializer.toJson<DateTime>(gcDate),
      'description': serializer.toJson<String?>(description),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'section': serializer.toJson<String>(section),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'linkedEventId': serializer.toJson<String?>(linkedEventId),
      'linkedReminderId': serializer.toJson<String?>(linkedReminderId),
      'accountId': serializer.toJson<String?>(accountId),
      'serverVersion': serializer.toJson<int>(serverVersion),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastOperationId': serializer.toJson<String?>(lastOperationId),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  PlannerItem copyWith({
    String? id,
    String? title,
    DateTime? ecDate,
    DateTime? gcDate,
    Value<String?> description = const Value.absent(),
    bool? isCompleted,
    String? section,
    int? sortOrder,
    Value<String?> linkedEventId = const Value.absent(),
    Value<String?> linkedReminderId = const Value.absent(),
    Value<String?> accountId = const Value.absent(),
    int? serverVersion,
    String? syncStatus,
    Value<String?> lastOperationId = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => PlannerItem(
    id: id ?? this.id,
    title: title ?? this.title,
    ecDate: ecDate ?? this.ecDate,
    gcDate: gcDate ?? this.gcDate,
    description: description.present ? description.value : this.description,
    isCompleted: isCompleted ?? this.isCompleted,
    section: section ?? this.section,
    sortOrder: sortOrder ?? this.sortOrder,
    linkedEventId: linkedEventId.present
        ? linkedEventId.value
        : this.linkedEventId,
    linkedReminderId: linkedReminderId.present
        ? linkedReminderId.value
        : this.linkedReminderId,
    accountId: accountId.present ? accountId.value : this.accountId,
    serverVersion: serverVersion ?? this.serverVersion,
    syncStatus: syncStatus ?? this.syncStatus,
    lastOperationId: lastOperationId.present
        ? lastOperationId.value
        : this.lastOperationId,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  PlannerItem copyWithCompanion(PlannerItemsCompanion data) {
    return PlannerItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      ecDate: data.ecDate.present ? data.ecDate.value : this.ecDate,
      gcDate: data.gcDate.present ? data.gcDate.value : this.gcDate,
      description: data.description.present
          ? data.description.value
          : this.description,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      section: data.section.present ? data.section.value : this.section,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      linkedEventId: data.linkedEventId.present
          ? data.linkedEventId.value
          : this.linkedEventId,
      linkedReminderId: data.linkedReminderId.present
          ? data.linkedReminderId.value
          : this.linkedReminderId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastOperationId: data.lastOperationId.present
          ? data.lastOperationId.value
          : this.lastOperationId,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlannerItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ecDate: $ecDate, ')
          ..write('gcDate: $gcDate, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('section: $section, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('linkedEventId: $linkedEventId, ')
          ..write('linkedReminderId: $linkedReminderId, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    ecDate,
    gcDate,
    description,
    isCompleted,
    section,
    sortOrder,
    linkedEventId,
    linkedReminderId,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlannerItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.ecDate == this.ecDate &&
          other.gcDate == this.gcDate &&
          other.description == this.description &&
          other.isCompleted == this.isCompleted &&
          other.section == this.section &&
          other.sortOrder == this.sortOrder &&
          other.linkedEventId == this.linkedEventId &&
          other.linkedReminderId == this.linkedReminderId &&
          other.accountId == this.accountId &&
          other.serverVersion == this.serverVersion &&
          other.syncStatus == this.syncStatus &&
          other.lastOperationId == this.lastOperationId &&
          other.deletedAt == this.deletedAt);
}

class PlannerItemsCompanion extends UpdateCompanion<PlannerItem> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> ecDate;
  final Value<DateTime> gcDate;
  final Value<String?> description;
  final Value<bool> isCompleted;
  final Value<String> section;
  final Value<int> sortOrder;
  final Value<String?> linkedEventId;
  final Value<String?> linkedReminderId;
  final Value<String?> accountId;
  final Value<int> serverVersion;
  final Value<String> syncStatus;
  final Value<String?> lastOperationId;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const PlannerItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.ecDate = const Value.absent(),
    this.gcDate = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.section = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.linkedEventId = const Value.absent(),
    this.linkedReminderId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannerItemsCompanion.insert({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.section = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.linkedEventId = const Value.absent(),
    this.linkedReminderId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       ecDate = Value(ecDate),
       gcDate = Value(gcDate);
  static Insertable<PlannerItem> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? ecDate,
    Expression<DateTime>? gcDate,
    Expression<String>? description,
    Expression<bool>? isCompleted,
    Expression<String>? section,
    Expression<int>? sortOrder,
    Expression<String>? linkedEventId,
    Expression<String>? linkedReminderId,
    Expression<String>? accountId,
    Expression<int>? serverVersion,
    Expression<String>? syncStatus,
    Expression<String>? lastOperationId,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (ecDate != null) 'ec_date': ecDate,
      if (gcDate != null) 'gc_date': gcDate,
      if (description != null) 'description': description,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (section != null) 'section': section,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (linkedEventId != null) 'linked_event_id': linkedEventId,
      if (linkedReminderId != null) 'linked_reminder_id': linkedReminderId,
      if (accountId != null) 'account_id': accountId,
      if (serverVersion != null) 'server_version': serverVersion,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastOperationId != null) 'last_operation_id': lastOperationId,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannerItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<DateTime>? ecDate,
    Value<DateTime>? gcDate,
    Value<String?>? description,
    Value<bool>? isCompleted,
    Value<String>? section,
    Value<int>? sortOrder,
    Value<String?>? linkedEventId,
    Value<String?>? linkedReminderId,
    Value<String?>? accountId,
    Value<int>? serverVersion,
    Value<String>? syncStatus,
    Value<String?>? lastOperationId,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return PlannerItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      ecDate: ecDate ?? this.ecDate,
      gcDate: gcDate ?? this.gcDate,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      section: section ?? this.section,
      sortOrder: sortOrder ?? this.sortOrder,
      linkedEventId: linkedEventId ?? this.linkedEventId,
      linkedReminderId: linkedReminderId ?? this.linkedReminderId,
      accountId: accountId ?? this.accountId,
      serverVersion: serverVersion ?? this.serverVersion,
      syncStatus: syncStatus ?? this.syncStatus,
      lastOperationId: lastOperationId ?? this.lastOperationId,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (ecDate.present) {
      map['ec_date'] = Variable<DateTime>(ecDate.value);
    }
    if (gcDate.present) {
      map['gc_date'] = Variable<DateTime>(gcDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (section.present) {
      map['section'] = Variable<String>(section.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (linkedEventId.present) {
      map['linked_event_id'] = Variable<String>(linkedEventId.value);
    }
    if (linkedReminderId.present) {
      map['linked_reminder_id'] = Variable<String>(linkedReminderId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (serverVersion.present) {
      map['server_version'] = Variable<int>(serverVersion.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastOperationId.present) {
      map['last_operation_id'] = Variable<String>(lastOperationId.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlannerItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ecDate: $ecDate, ')
          ..write('gcDate: $gcDate, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('section: $section, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('linkedEventId: $linkedEventId, ')
          ..write('linkedReminderId: $linkedReminderId, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ecDateMeta = const VerificationMeta('ecDate');
  @override
  late final GeneratedColumn<DateTime> ecDate = GeneratedColumn<DateTime>(
    'ec_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gcDateMeta = const VerificationMeta('gcDate');
  @override
  late final GeneratedColumn<DateTime> gcDate = GeneratedColumn<DateTime>(
    'gc_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notificationIdMeta = const VerificationMeta(
    'notificationId',
  );
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
    'notification_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _linkedEventIdMeta = const VerificationMeta(
    'linkedEventId',
  );
  @override
  late final GeneratedColumn<String> linkedEventId = GeneratedColumn<String>(
    'linked_event_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recurrenceRuleMeta = const VerificationMeta(
    'recurrenceRule',
  );
  @override
  late final GeneratedColumn<String> recurrenceRule = GeneratedColumn<String>(
    'recurrence_rule',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverVersionMeta = const VerificationMeta(
    'serverVersion',
  );
  @override
  late final GeneratedColumn<int> serverVersion = GeneratedColumn<int>(
    'server_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _lastOperationIdMeta = const VerificationMeta(
    'lastOperationId',
  );
  @override
  late final GeneratedColumn<String> lastOperationId = GeneratedColumn<String>(
    'last_operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    ecDate,
    gcDate,
    description,
    isCompleted,
    notificationId,
    category,
    linkedEventId,
    recurrenceRule,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('ec_date')) {
      context.handle(
        _ecDateMeta,
        ecDate.isAcceptableOrUnknown(data['ec_date']!, _ecDateMeta),
      );
    } else if (isInserting) {
      context.missing(_ecDateMeta);
    }
    if (data.containsKey('gc_date')) {
      context.handle(
        _gcDateMeta,
        gcDate.isAcceptableOrUnknown(data['gc_date']!, _gcDateMeta),
      );
    } else if (isInserting) {
      context.missing(_gcDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('notification_id')) {
      context.handle(
        _notificationIdMeta,
        notificationId.isAcceptableOrUnknown(
          data['notification_id']!,
          _notificationIdMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('linked_event_id')) {
      context.handle(
        _linkedEventIdMeta,
        linkedEventId.isAcceptableOrUnknown(
          data['linked_event_id']!,
          _linkedEventIdMeta,
        ),
      );
    }
    if (data.containsKey('recurrence_rule')) {
      context.handle(
        _recurrenceRuleMeta,
        recurrenceRule.isAcceptableOrUnknown(
          data['recurrence_rule']!,
          _recurrenceRuleMeta,
        ),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('server_version')) {
      context.handle(
        _serverVersionMeta,
        serverVersion.isAcceptableOrUnknown(
          data['server_version']!,
          _serverVersionMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_operation_id')) {
      context.handle(
        _lastOperationIdMeta,
        lastOperationId.isAcceptableOrUnknown(
          data['last_operation_id']!,
          _lastOperationIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      ecDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ec_date'],
      )!,
      gcDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}gc_date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      notificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_id'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      linkedEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_event_id'],
      ),
      recurrenceRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence_rule'],
      ),
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      serverVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_version'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastOperationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_operation_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final String id;
  final String title;
  final DateTime ecDate;
  final DateTime gcDate;
  final String? description;
  final bool isCompleted;
  final int? notificationId;
  final String? category;
  final String? linkedEventId;
  final String? recurrenceRule;
  final String? accountId;
  final int serverVersion;
  final String syncStatus;
  final String? lastOperationId;
  final DateTime? deletedAt;
  const Reminder({
    required this.id,
    required this.title,
    required this.ecDate,
    required this.gcDate,
    this.description,
    required this.isCompleted,
    this.notificationId,
    this.category,
    this.linkedEventId,
    this.recurrenceRule,
    this.accountId,
    required this.serverVersion,
    required this.syncStatus,
    this.lastOperationId,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['ec_date'] = Variable<DateTime>(ecDate);
    map['gc_date'] = Variable<DateTime>(gcDate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    if (!nullToAbsent || notificationId != null) {
      map['notification_id'] = Variable<int>(notificationId);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || linkedEventId != null) {
      map['linked_event_id'] = Variable<String>(linkedEventId);
    }
    if (!nullToAbsent || recurrenceRule != null) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule);
    }
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    map['server_version'] = Variable<int>(serverVersion);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastOperationId != null) {
      map['last_operation_id'] = Variable<String>(lastOperationId);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      title: Value(title),
      ecDate: Value(ecDate),
      gcDate: Value(gcDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isCompleted: Value(isCompleted),
      notificationId: notificationId == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationId),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      linkedEventId: linkedEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedEventId),
      recurrenceRule: recurrenceRule == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceRule),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      serverVersion: Value(serverVersion),
      syncStatus: Value(syncStatus),
      lastOperationId: lastOperationId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastOperationId),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      ecDate: serializer.fromJson<DateTime>(json['ecDate']),
      gcDate: serializer.fromJson<DateTime>(json['gcDate']),
      description: serializer.fromJson<String?>(json['description']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      notificationId: serializer.fromJson<int?>(json['notificationId']),
      category: serializer.fromJson<String?>(json['category']),
      linkedEventId: serializer.fromJson<String?>(json['linkedEventId']),
      recurrenceRule: serializer.fromJson<String?>(json['recurrenceRule']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      serverVersion: serializer.fromJson<int>(json['serverVersion']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastOperationId: serializer.fromJson<String?>(json['lastOperationId']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'ecDate': serializer.toJson<DateTime>(ecDate),
      'gcDate': serializer.toJson<DateTime>(gcDate),
      'description': serializer.toJson<String?>(description),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'notificationId': serializer.toJson<int?>(notificationId),
      'category': serializer.toJson<String?>(category),
      'linkedEventId': serializer.toJson<String?>(linkedEventId),
      'recurrenceRule': serializer.toJson<String?>(recurrenceRule),
      'accountId': serializer.toJson<String?>(accountId),
      'serverVersion': serializer.toJson<int>(serverVersion),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastOperationId': serializer.toJson<String?>(lastOperationId),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Reminder copyWith({
    String? id,
    String? title,
    DateTime? ecDate,
    DateTime? gcDate,
    Value<String?> description = const Value.absent(),
    bool? isCompleted,
    Value<int?> notificationId = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> linkedEventId = const Value.absent(),
    Value<String?> recurrenceRule = const Value.absent(),
    Value<String?> accountId = const Value.absent(),
    int? serverVersion,
    String? syncStatus,
    Value<String?> lastOperationId = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Reminder(
    id: id ?? this.id,
    title: title ?? this.title,
    ecDate: ecDate ?? this.ecDate,
    gcDate: gcDate ?? this.gcDate,
    description: description.present ? description.value : this.description,
    isCompleted: isCompleted ?? this.isCompleted,
    notificationId: notificationId.present
        ? notificationId.value
        : this.notificationId,
    category: category.present ? category.value : this.category,
    linkedEventId: linkedEventId.present
        ? linkedEventId.value
        : this.linkedEventId,
    recurrenceRule: recurrenceRule.present
        ? recurrenceRule.value
        : this.recurrenceRule,
    accountId: accountId.present ? accountId.value : this.accountId,
    serverVersion: serverVersion ?? this.serverVersion,
    syncStatus: syncStatus ?? this.syncStatus,
    lastOperationId: lastOperationId.present
        ? lastOperationId.value
        : this.lastOperationId,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      ecDate: data.ecDate.present ? data.ecDate.value : this.ecDate,
      gcDate: data.gcDate.present ? data.gcDate.value : this.gcDate,
      description: data.description.present
          ? data.description.value
          : this.description,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
      category: data.category.present ? data.category.value : this.category,
      linkedEventId: data.linkedEventId.present
          ? data.linkedEventId.value
          : this.linkedEventId,
      recurrenceRule: data.recurrenceRule.present
          ? data.recurrenceRule.value
          : this.recurrenceRule,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastOperationId: data.lastOperationId.present
          ? data.lastOperationId.value
          : this.lastOperationId,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ecDate: $ecDate, ')
          ..write('gcDate: $gcDate, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('notificationId: $notificationId, ')
          ..write('category: $category, ')
          ..write('linkedEventId: $linkedEventId, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    ecDate,
    gcDate,
    description,
    isCompleted,
    notificationId,
    category,
    linkedEventId,
    recurrenceRule,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.title == this.title &&
          other.ecDate == this.ecDate &&
          other.gcDate == this.gcDate &&
          other.description == this.description &&
          other.isCompleted == this.isCompleted &&
          other.notificationId == this.notificationId &&
          other.category == this.category &&
          other.linkedEventId == this.linkedEventId &&
          other.recurrenceRule == this.recurrenceRule &&
          other.accountId == this.accountId &&
          other.serverVersion == this.serverVersion &&
          other.syncStatus == this.syncStatus &&
          other.lastOperationId == this.lastOperationId &&
          other.deletedAt == this.deletedAt);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> ecDate;
  final Value<DateTime> gcDate;
  final Value<String?> description;
  final Value<bool> isCompleted;
  final Value<int?> notificationId;
  final Value<String?> category;
  final Value<String?> linkedEventId;
  final Value<String?> recurrenceRule;
  final Value<String?> accountId;
  final Value<int> serverVersion;
  final Value<String> syncStatus;
  final Value<String?> lastOperationId;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.ecDate = const Value.absent(),
    this.gcDate = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.category = const Value.absent(),
    this.linkedEventId = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.category = const Value.absent(),
    this.linkedEventId = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       ecDate = Value(ecDate),
       gcDate = Value(gcDate);
  static Insertable<Reminder> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? ecDate,
    Expression<DateTime>? gcDate,
    Expression<String>? description,
    Expression<bool>? isCompleted,
    Expression<int>? notificationId,
    Expression<String>? category,
    Expression<String>? linkedEventId,
    Expression<String>? recurrenceRule,
    Expression<String>? accountId,
    Expression<int>? serverVersion,
    Expression<String>? syncStatus,
    Expression<String>? lastOperationId,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (ecDate != null) 'ec_date': ecDate,
      if (gcDate != null) 'gc_date': gcDate,
      if (description != null) 'description': description,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (notificationId != null) 'notification_id': notificationId,
      if (category != null) 'category': category,
      if (linkedEventId != null) 'linked_event_id': linkedEventId,
      if (recurrenceRule != null) 'recurrence_rule': recurrenceRule,
      if (accountId != null) 'account_id': accountId,
      if (serverVersion != null) 'server_version': serverVersion,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastOperationId != null) 'last_operation_id': lastOperationId,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<DateTime>? ecDate,
    Value<DateTime>? gcDate,
    Value<String?>? description,
    Value<bool>? isCompleted,
    Value<int?>? notificationId,
    Value<String?>? category,
    Value<String?>? linkedEventId,
    Value<String?>? recurrenceRule,
    Value<String?>? accountId,
    Value<int>? serverVersion,
    Value<String>? syncStatus,
    Value<String?>? lastOperationId,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      ecDate: ecDate ?? this.ecDate,
      gcDate: gcDate ?? this.gcDate,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      notificationId: notificationId ?? this.notificationId,
      category: category ?? this.category,
      linkedEventId: linkedEventId ?? this.linkedEventId,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
      accountId: accountId ?? this.accountId,
      serverVersion: serverVersion ?? this.serverVersion,
      syncStatus: syncStatus ?? this.syncStatus,
      lastOperationId: lastOperationId ?? this.lastOperationId,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (ecDate.present) {
      map['ec_date'] = Variable<DateTime>(ecDate.value);
    }
    if (gcDate.present) {
      map['gc_date'] = Variable<DateTime>(gcDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (linkedEventId.present) {
      map['linked_event_id'] = Variable<String>(linkedEventId.value);
    }
    if (recurrenceRule.present) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (serverVersion.present) {
      map['server_version'] = Variable<int>(serverVersion.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastOperationId.present) {
      map['last_operation_id'] = Variable<String>(lastOperationId.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ecDate: $ecDate, ')
          ..write('gcDate: $gcDate, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('notificationId: $notificationId, ')
          ..write('category: $category, ')
          ..write('linkedEventId: $linkedEventId, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPinnedMeta = const VerificationMeta(
    'isPinned',
  );
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
    'is_pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _linkedEventIdMeta = const VerificationMeta(
    'linkedEventId',
  );
  @override
  late final GeneratedColumn<String> linkedEventId = GeneratedColumn<String>(
    'linked_event_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _linkedReminderIdMeta = const VerificationMeta(
    'linkedReminderId',
  );
  @override
  late final GeneratedColumn<String> linkedReminderId = GeneratedColumn<String>(
    'linked_reminder_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _linkedPlannerItemIdMeta =
      const VerificationMeta('linkedPlannerItemId');
  @override
  late final GeneratedColumn<String> linkedPlannerItemId =
      GeneratedColumn<String>(
        'linked_planner_item_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverVersionMeta = const VerificationMeta(
    'serverVersion',
  );
  @override
  late final GeneratedColumn<int> serverVersion = GeneratedColumn<int>(
    'server_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _lastOperationIdMeta = const VerificationMeta(
    'lastOperationId',
  );
  @override
  late final GeneratedColumn<String> lastOperationId = GeneratedColumn<String>(
    'last_operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    content,
    createdAt,
    updatedAt,
    isPinned,
    isArchived,
    category,
    linkedEventId,
    linkedReminderId,
    linkedPlannerItemId,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Note> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_pinned')) {
      context.handle(
        _isPinnedMeta,
        isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('linked_event_id')) {
      context.handle(
        _linkedEventIdMeta,
        linkedEventId.isAcceptableOrUnknown(
          data['linked_event_id']!,
          _linkedEventIdMeta,
        ),
      );
    }
    if (data.containsKey('linked_reminder_id')) {
      context.handle(
        _linkedReminderIdMeta,
        linkedReminderId.isAcceptableOrUnknown(
          data['linked_reminder_id']!,
          _linkedReminderIdMeta,
        ),
      );
    }
    if (data.containsKey('linked_planner_item_id')) {
      context.handle(
        _linkedPlannerItemIdMeta,
        linkedPlannerItemId.isAcceptableOrUnknown(
          data['linked_planner_item_id']!,
          _linkedPlannerItemIdMeta,
        ),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('server_version')) {
      context.handle(
        _serverVersionMeta,
        serverVersion.isAcceptableOrUnknown(
          data['server_version']!,
          _serverVersionMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_operation_id')) {
      context.handle(
        _lastOperationIdMeta,
        lastOperationId.isAcceptableOrUnknown(
          data['last_operation_id']!,
          _lastOperationIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isPinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      linkedEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_event_id'],
      ),
      linkedReminderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_reminder_id'],
      ),
      linkedPlannerItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_planner_item_id'],
      ),
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      serverVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_version'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastOperationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_operation_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final String id;
  final String title;
  final String? content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPinned;
  final bool isArchived;
  final String? category;
  final String? linkedEventId;
  final String? linkedReminderId;
  final String? linkedPlannerItemId;
  final String? accountId;
  final int serverVersion;
  final String syncStatus;
  final String? lastOperationId;
  final DateTime? deletedAt;
  const Note({
    required this.id,
    required this.title,
    this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.isPinned,
    required this.isArchived,
    this.category,
    this.linkedEventId,
    this.linkedReminderId,
    this.linkedPlannerItemId,
    this.accountId,
    required this.serverVersion,
    required this.syncStatus,
    this.lastOperationId,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_pinned'] = Variable<bool>(isPinned);
    map['is_archived'] = Variable<bool>(isArchived);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || linkedEventId != null) {
      map['linked_event_id'] = Variable<String>(linkedEventId);
    }
    if (!nullToAbsent || linkedReminderId != null) {
      map['linked_reminder_id'] = Variable<String>(linkedReminderId);
    }
    if (!nullToAbsent || linkedPlannerItemId != null) {
      map['linked_planner_item_id'] = Variable<String>(linkedPlannerItemId);
    }
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    map['server_version'] = Variable<int>(serverVersion);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastOperationId != null) {
      map['last_operation_id'] = Variable<String>(lastOperationId);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      title: Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isPinned: Value(isPinned),
      isArchived: Value(isArchived),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      linkedEventId: linkedEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedEventId),
      linkedReminderId: linkedReminderId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedReminderId),
      linkedPlannerItemId: linkedPlannerItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedPlannerItemId),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      serverVersion: Value(serverVersion),
      syncStatus: Value(syncStatus),
      lastOperationId: lastOperationId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastOperationId),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Note.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      category: serializer.fromJson<String?>(json['category']),
      linkedEventId: serializer.fromJson<String?>(json['linkedEventId']),
      linkedReminderId: serializer.fromJson<String?>(json['linkedReminderId']),
      linkedPlannerItemId: serializer.fromJson<String?>(
        json['linkedPlannerItemId'],
      ),
      accountId: serializer.fromJson<String?>(json['accountId']),
      serverVersion: serializer.fromJson<int>(json['serverVersion']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastOperationId: serializer.fromJson<String?>(json['lastOperationId']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String?>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isPinned': serializer.toJson<bool>(isPinned),
      'isArchived': serializer.toJson<bool>(isArchived),
      'category': serializer.toJson<String?>(category),
      'linkedEventId': serializer.toJson<String?>(linkedEventId),
      'linkedReminderId': serializer.toJson<String?>(linkedReminderId),
      'linkedPlannerItemId': serializer.toJson<String?>(linkedPlannerItemId),
      'accountId': serializer.toJson<String?>(accountId),
      'serverVersion': serializer.toJson<int>(serverVersion),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastOperationId': serializer.toJson<String?>(lastOperationId),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Note copyWith({
    String? id,
    String? title,
    Value<String?> content = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPinned,
    bool? isArchived,
    Value<String?> category = const Value.absent(),
    Value<String?> linkedEventId = const Value.absent(),
    Value<String?> linkedReminderId = const Value.absent(),
    Value<String?> linkedPlannerItemId = const Value.absent(),
    Value<String?> accountId = const Value.absent(),
    int? serverVersion,
    String? syncStatus,
    Value<String?> lastOperationId = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Note(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content.present ? content.value : this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isPinned: isPinned ?? this.isPinned,
    isArchived: isArchived ?? this.isArchived,
    category: category.present ? category.value : this.category,
    linkedEventId: linkedEventId.present
        ? linkedEventId.value
        : this.linkedEventId,
    linkedReminderId: linkedReminderId.present
        ? linkedReminderId.value
        : this.linkedReminderId,
    linkedPlannerItemId: linkedPlannerItemId.present
        ? linkedPlannerItemId.value
        : this.linkedPlannerItemId,
    accountId: accountId.present ? accountId.value : this.accountId,
    serverVersion: serverVersion ?? this.serverVersion,
    syncStatus: syncStatus ?? this.syncStatus,
    lastOperationId: lastOperationId.present
        ? lastOperationId.value
        : this.lastOperationId,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      category: data.category.present ? data.category.value : this.category,
      linkedEventId: data.linkedEventId.present
          ? data.linkedEventId.value
          : this.linkedEventId,
      linkedReminderId: data.linkedReminderId.present
          ? data.linkedReminderId.value
          : this.linkedReminderId,
      linkedPlannerItemId: data.linkedPlannerItemId.present
          ? data.linkedPlannerItemId.value
          : this.linkedPlannerItemId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastOperationId: data.lastOperationId.present
          ? data.lastOperationId.value
          : this.lastOperationId,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isPinned: $isPinned, ')
          ..write('isArchived: $isArchived, ')
          ..write('category: $category, ')
          ..write('linkedEventId: $linkedEventId, ')
          ..write('linkedReminderId: $linkedReminderId, ')
          ..write('linkedPlannerItemId: $linkedPlannerItemId, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    content,
    createdAt,
    updatedAt,
    isPinned,
    isArchived,
    category,
    linkedEventId,
    linkedReminderId,
    linkedPlannerItemId,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isPinned == this.isPinned &&
          other.isArchived == this.isArchived &&
          other.category == this.category &&
          other.linkedEventId == this.linkedEventId &&
          other.linkedReminderId == this.linkedReminderId &&
          other.linkedPlannerItemId == this.linkedPlannerItemId &&
          other.accountId == this.accountId &&
          other.serverVersion == this.serverVersion &&
          other.syncStatus == this.syncStatus &&
          other.lastOperationId == this.lastOperationId &&
          other.deletedAt == this.deletedAt);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> content;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isPinned;
  final Value<bool> isArchived;
  final Value<String?> category;
  final Value<String?> linkedEventId;
  final Value<String?> linkedReminderId;
  final Value<String?> linkedPlannerItemId;
  final Value<String?> accountId;
  final Value<int> serverVersion;
  final Value<String> syncStatus;
  final Value<String?> lastOperationId;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.category = const Value.absent(),
    this.linkedEventId = const Value.absent(),
    this.linkedReminderId = const Value.absent(),
    this.linkedPlannerItemId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    required String title,
    this.content = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isPinned = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.category = const Value.absent(),
    this.linkedEventId = const Value.absent(),
    this.linkedReminderId = const Value.absent(),
    this.linkedPlannerItemId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Note> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isPinned,
    Expression<bool>? isArchived,
    Expression<String>? category,
    Expression<String>? linkedEventId,
    Expression<String>? linkedReminderId,
    Expression<String>? linkedPlannerItemId,
    Expression<String>? accountId,
    Expression<int>? serverVersion,
    Expression<String>? syncStatus,
    Expression<String>? lastOperationId,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isPinned != null) 'is_pinned': isPinned,
      if (isArchived != null) 'is_archived': isArchived,
      if (category != null) 'category': category,
      if (linkedEventId != null) 'linked_event_id': linkedEventId,
      if (linkedReminderId != null) 'linked_reminder_id': linkedReminderId,
      if (linkedPlannerItemId != null)
        'linked_planner_item_id': linkedPlannerItemId,
      if (accountId != null) 'account_id': accountId,
      if (serverVersion != null) 'server_version': serverVersion,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastOperationId != null) 'last_operation_id': lastOperationId,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? content,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isPinned,
    Value<bool>? isArchived,
    Value<String?>? category,
    Value<String?>? linkedEventId,
    Value<String?>? linkedReminderId,
    Value<String?>? linkedPlannerItemId,
    Value<String?>? accountId,
    Value<int>? serverVersion,
    Value<String>? syncStatus,
    Value<String?>? lastOperationId,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return NotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPinned: isPinned ?? this.isPinned,
      isArchived: isArchived ?? this.isArchived,
      category: category ?? this.category,
      linkedEventId: linkedEventId ?? this.linkedEventId,
      linkedReminderId: linkedReminderId ?? this.linkedReminderId,
      linkedPlannerItemId: linkedPlannerItemId ?? this.linkedPlannerItemId,
      accountId: accountId ?? this.accountId,
      serverVersion: serverVersion ?? this.serverVersion,
      syncStatus: syncStatus ?? this.syncStatus,
      lastOperationId: lastOperationId ?? this.lastOperationId,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (linkedEventId.present) {
      map['linked_event_id'] = Variable<String>(linkedEventId.value);
    }
    if (linkedReminderId.present) {
      map['linked_reminder_id'] = Variable<String>(linkedReminderId.value);
    }
    if (linkedPlannerItemId.present) {
      map['linked_planner_item_id'] = Variable<String>(
        linkedPlannerItemId.value,
      );
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (serverVersion.present) {
      map['server_version'] = Variable<int>(serverVersion.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastOperationId.present) {
      map['last_operation_id'] = Variable<String>(lastOperationId.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isPinned: $isPinned, ')
          ..write('isArchived: $isArchived, ')
          ..write('category: $category, ')
          ..write('linkedEventId: $linkedEventId, ')
          ..write('linkedReminderId: $linkedReminderId, ')
          ..write('linkedPlannerItemId: $linkedPlannerItemId, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecentlyDeletedItemsTable extends RecentlyDeletedItems
    with TableInfo<$RecentlyDeletedItemsTable, RecentlyDeletedItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentlyDeletedItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTitleMeta = const VerificationMeta(
    'entityTitle',
  );
  @override
  late final GeneratedColumn<String> entityTitle = GeneratedColumn<String>(
    'entity_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityDataMeta = const VerificationMeta(
    'entityData',
  );
  @override
  late final GeneratedColumn<String> entityData = GeneratedColumn<String>(
    'entity_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    entityTitle,
    deletedAt,
    entityData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recently_deleted_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecentlyDeletedItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('entity_title')) {
      context.handle(
        _entityTitleMeta,
        entityTitle.isAcceptableOrUnknown(
          data['entity_title']!,
          _entityTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_entityTitleMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_deletedAtMeta);
    }
    if (data.containsKey('entity_data')) {
      context.handle(
        _entityDataMeta,
        entityData.isAcceptableOrUnknown(data['entity_data']!, _entityDataMeta),
      );
    } else if (isInserting) {
      context.missing(_entityDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecentlyDeletedItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentlyDeletedItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      entityTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_title'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      )!,
      entityData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_data'],
      )!,
    );
  }

  @override
  $RecentlyDeletedItemsTable createAlias(String alias) {
    return $RecentlyDeletedItemsTable(attachedDatabase, alias);
  }
}

class RecentlyDeletedItem extends DataClass
    implements Insertable<RecentlyDeletedItem> {
  final String id;
  final String entityType;
  final String entityId;
  final String entityTitle;
  final DateTime deletedAt;
  final String entityData;
  const RecentlyDeletedItem({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.entityTitle,
    required this.deletedAt,
    required this.entityData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['entity_title'] = Variable<String>(entityTitle);
    map['deleted_at'] = Variable<DateTime>(deletedAt);
    map['entity_data'] = Variable<String>(entityData);
    return map;
  }

  RecentlyDeletedItemsCompanion toCompanion(bool nullToAbsent) {
    return RecentlyDeletedItemsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      entityTitle: Value(entityTitle),
      deletedAt: Value(deletedAt),
      entityData: Value(entityData),
    );
  }

  factory RecentlyDeletedItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentlyDeletedItem(
      id: serializer.fromJson<String>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      entityTitle: serializer.fromJson<String>(json['entityTitle']),
      deletedAt: serializer.fromJson<DateTime>(json['deletedAt']),
      entityData: serializer.fromJson<String>(json['entityData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'entityTitle': serializer.toJson<String>(entityTitle),
      'deletedAt': serializer.toJson<DateTime>(deletedAt),
      'entityData': serializer.toJson<String>(entityData),
    };
  }

  RecentlyDeletedItem copyWith({
    String? id,
    String? entityType,
    String? entityId,
    String? entityTitle,
    DateTime? deletedAt,
    String? entityData,
  }) => RecentlyDeletedItem(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    entityTitle: entityTitle ?? this.entityTitle,
    deletedAt: deletedAt ?? this.deletedAt,
    entityData: entityData ?? this.entityData,
  );
  RecentlyDeletedItem copyWithCompanion(RecentlyDeletedItemsCompanion data) {
    return RecentlyDeletedItem(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      entityTitle: data.entityTitle.present
          ? data.entityTitle.value
          : this.entityTitle,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      entityData: data.entityData.present
          ? data.entityData.value
          : this.entityData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecentlyDeletedItem(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('entityTitle: $entityTitle, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('entityData: $entityData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, entityType, entityId, entityTitle, deletedAt, entityData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentlyDeletedItem &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.entityTitle == this.entityTitle &&
          other.deletedAt == this.deletedAt &&
          other.entityData == this.entityData);
}

class RecentlyDeletedItemsCompanion
    extends UpdateCompanion<RecentlyDeletedItem> {
  final Value<String> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> entityTitle;
  final Value<DateTime> deletedAt;
  final Value<String> entityData;
  final Value<int> rowid;
  const RecentlyDeletedItemsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.entityTitle = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.entityData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecentlyDeletedItemsCompanion.insert({
    required String id,
    required String entityType,
    required String entityId,
    required String entityTitle,
    required DateTime deletedAt,
    required String entityData,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entityType = Value(entityType),
       entityId = Value(entityId),
       entityTitle = Value(entityTitle),
       deletedAt = Value(deletedAt),
       entityData = Value(entityData);
  static Insertable<RecentlyDeletedItem> custom({
    Expression<String>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? entityTitle,
    Expression<DateTime>? deletedAt,
    Expression<String>? entityData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (entityTitle != null) 'entity_title': entityTitle,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (entityData != null) 'entity_data': entityData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecentlyDeletedItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? entityTitle,
    Value<DateTime>? deletedAt,
    Value<String>? entityData,
    Value<int>? rowid,
  }) {
    return RecentlyDeletedItemsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      entityTitle: entityTitle ?? this.entityTitle,
      deletedAt: deletedAt ?? this.deletedAt,
      entityData: entityData ?? this.entityData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (entityTitle.present) {
      map['entity_title'] = Variable<String>(entityTitle.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (entityData.present) {
      map['entity_data'] = Variable<String>(entityData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentlyDeletedItemsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('entityTitle: $entityTitle, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('entityData: $entityData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OutboxOperationsTable extends OutboxOperations
    with TableInfo<$OutboxOperationsTable, OutboxOperation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboxOperationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationTypeMeta = const VerificationMeta(
    'operationType',
  );
  @override
  late final GeneratedColumn<String> operationType = GeneratedColumn<String>(
    'operation_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastAttemptAtMeta = const VerificationMeta(
    'lastAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>(
        'last_attempt_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    operationType,
    payload,
    createdAt,
    retryCount,
    lastError,
    lastAttemptAt,
    accountId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbox_operations';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboxOperation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('operation_type')) {
      context.handle(
        _operationTypeMeta,
        operationType.isAcceptableOrUnknown(
          data['operation_type']!,
          _operationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationTypeMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
        _lastAttemptAtMeta,
        lastAttemptAt.isAcceptableOrUnknown(
          data['last_attempt_at']!,
          _lastAttemptAtMeta,
        ),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutboxOperation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboxOperation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      operationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_type'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      lastAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_attempt_at'],
      ),
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
    );
  }

  @override
  $OutboxOperationsTable createAlias(String alias) {
    return $OutboxOperationsTable(attachedDatabase, alias);
  }
}

class OutboxOperation extends DataClass implements Insertable<OutboxOperation> {
  /// Unique operation ID — the idempotency key (UUID).
  final String id;

  /// The entity type this operation targets (e.g. 'event', 'reminder').
  final String entityType;

  /// The entity ID affected by this operation.
  final String entityId;

  /// The operation type: 'create', 'update', 'delete'.
  final String operationType;

  /// JSON-serialized payload for create/update operations.
  final String? payload;

  /// When this operation was created locally.
  final DateTime createdAt;

  /// Number of times this operation has been retried.
  final int retryCount;

  /// Last error message if the operation failed.
  final String? lastError;

  /// When the last attempt was made.
  final DateTime? lastAttemptAt;

  /// The owning account ID.
  final String? accountId;
  const OutboxOperation({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.operationType,
    this.payload,
    required this.createdAt,
    required this.retryCount,
    this.lastError,
    this.lastAttemptAt,
    this.accountId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['operation_type'] = Variable<String>(operationType);
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    return map;
  }

  OutboxOperationsCompanion toCompanion(bool nullToAbsent) {
    return OutboxOperationsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      operationType: Value(operationType),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
      createdAt: Value(createdAt),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
    );
  }

  factory OutboxOperation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboxOperation(
      id: serializer.fromJson<String>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      operationType: serializer.fromJson<String>(json['operationType']),
      payload: serializer.fromJson<String?>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
      accountId: serializer.fromJson<String?>(json['accountId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'operationType': serializer.toJson<String>(operationType),
      'payload': serializer.toJson<String?>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
      'accountId': serializer.toJson<String?>(accountId),
    };
  }

  OutboxOperation copyWith({
    String? id,
    String? entityType,
    String? entityId,
    String? operationType,
    Value<String?> payload = const Value.absent(),
    DateTime? createdAt,
    int? retryCount,
    Value<String?> lastError = const Value.absent(),
    Value<DateTime?> lastAttemptAt = const Value.absent(),
    Value<String?> accountId = const Value.absent(),
  }) => OutboxOperation(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    operationType: operationType ?? this.operationType,
    payload: payload.present ? payload.value : this.payload,
    createdAt: createdAt ?? this.createdAt,
    retryCount: retryCount ?? this.retryCount,
    lastError: lastError.present ? lastError.value : this.lastError,
    lastAttemptAt: lastAttemptAt.present
        ? lastAttemptAt.value
        : this.lastAttemptAt,
    accountId: accountId.present ? accountId.value : this.accountId,
  );
  OutboxOperation copyWithCompanion(OutboxOperationsCompanion data) {
    return OutboxOperation(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboxOperation(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operationType: $operationType, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('accountId: $accountId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    operationType,
    payload,
    createdAt,
    retryCount,
    lastError,
    lastAttemptAt,
    accountId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboxOperation &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.operationType == this.operationType &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError &&
          other.lastAttemptAt == this.lastAttemptAt &&
          other.accountId == this.accountId);
}

class OutboxOperationsCompanion extends UpdateCompanion<OutboxOperation> {
  final Value<String> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> operationType;
  final Value<String?> payload;
  final Value<DateTime> createdAt;
  final Value<int> retryCount;
  final Value<String?> lastError;
  final Value<DateTime?> lastAttemptAt;
  final Value<String?> accountId;
  final Value<int> rowid;
  const OutboxOperationsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operationType = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.accountId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OutboxOperationsCompanion.insert({
    required String id,
    required String entityType,
    required String entityId,
    required String operationType,
    this.payload = const Value.absent(),
    required DateTime createdAt,
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.accountId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entityType = Value(entityType),
       entityId = Value(entityId),
       operationType = Value(operationType),
       createdAt = Value(createdAt);
  static Insertable<OutboxOperation> custom({
    Expression<String>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? operationType,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? retryCount,
    Expression<String>? lastError,
    Expression<DateTime>? lastAttemptAt,
    Expression<String>? accountId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (operationType != null) 'operation_type': operationType,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
      if (accountId != null) 'account_id': accountId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OutboxOperationsCompanion copyWith({
    Value<String>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? operationType,
    Value<String?>? payload,
    Value<DateTime>? createdAt,
    Value<int>? retryCount,
    Value<String?>? lastError,
    Value<DateTime?>? lastAttemptAt,
    Value<String?>? accountId,
    Value<int>? rowid,
  }) {
    return OutboxOperationsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operationType: operationType ?? this.operationType,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
      accountId: accountId ?? this.accountId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<String>(operationType.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboxOperationsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operationType: $operationType, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('accountId: $accountId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NoteRevisionsTable extends NoteRevisions
    with TableInfo<$NoteRevisionsTable, NoteRevision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteRevisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<String> noteId = GeneratedColumn<String>(
    'note_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revisionNumberMeta = const VerificationMeta(
    'revisionNumber',
  );
  @override
  late final GeneratedColumn<int> revisionNumber = GeneratedColumn<int>(
    'revision_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    noteId,
    title,
    content,
    category,
    revisionNumber,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_revisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteRevision> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('revision_number')) {
      context.handle(
        _revisionNumberMeta,
        revisionNumber.isAcceptableOrUnknown(
          data['revision_number']!,
          _revisionNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_revisionNumberMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteRevision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteRevision(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      revisionNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision_number'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $NoteRevisionsTable createAlias(String alias) {
    return $NoteRevisionsTable(attachedDatabase, alias);
  }
}

class NoteRevision extends DataClass implements Insertable<NoteRevision> {
  final String id;
  final String noteId;
  final String title;
  final String? content;
  final String? category;
  final int revisionNumber;
  final DateTime createdAt;
  const NoteRevision({
    required this.id,
    required this.noteId,
    required this.title,
    this.content,
    this.category,
    required this.revisionNumber,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['note_id'] = Variable<String>(noteId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['revision_number'] = Variable<int>(revisionNumber);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NoteRevisionsCompanion toCompanion(bool nullToAbsent) {
    return NoteRevisionsCompanion(
      id: Value(id),
      noteId: Value(noteId),
      title: Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      revisionNumber: Value(revisionNumber),
      createdAt: Value(createdAt),
    );
  }

  factory NoteRevision.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteRevision(
      id: serializer.fromJson<String>(json['id']),
      noteId: serializer.fromJson<String>(json['noteId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      category: serializer.fromJson<String?>(json['category']),
      revisionNumber: serializer.fromJson<int>(json['revisionNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'noteId': serializer.toJson<String>(noteId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String?>(content),
      'category': serializer.toJson<String?>(category),
      'revisionNumber': serializer.toJson<int>(revisionNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  NoteRevision copyWith({
    String? id,
    String? noteId,
    String? title,
    Value<String?> content = const Value.absent(),
    Value<String?> category = const Value.absent(),
    int? revisionNumber,
    DateTime? createdAt,
  }) => NoteRevision(
    id: id ?? this.id,
    noteId: noteId ?? this.noteId,
    title: title ?? this.title,
    content: content.present ? content.value : this.content,
    category: category.present ? category.value : this.category,
    revisionNumber: revisionNumber ?? this.revisionNumber,
    createdAt: createdAt ?? this.createdAt,
  );
  NoteRevision copyWithCompanion(NoteRevisionsCompanion data) {
    return NoteRevision(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      category: data.category.present ? data.category.value : this.category,
      revisionNumber: data.revisionNumber.present
          ? data.revisionNumber.value
          : this.revisionNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteRevision(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('revisionNumber: $revisionNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    noteId,
    title,
    content,
    category,
    revisionNumber,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteRevision &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category &&
          other.revisionNumber == this.revisionNumber &&
          other.createdAt == this.createdAt);
}

class NoteRevisionsCompanion extends UpdateCompanion<NoteRevision> {
  final Value<String> id;
  final Value<String> noteId;
  final Value<String> title;
  final Value<String?> content;
  final Value<String?> category;
  final Value<int> revisionNumber;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const NoteRevisionsCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    this.revisionNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NoteRevisionsCompanion.insert({
    required String id,
    required String noteId,
    required String title,
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    required int revisionNumber,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       noteId = Value(noteId),
       title = Value(title),
       revisionNumber = Value(revisionNumber),
       createdAt = Value(createdAt);
  static Insertable<NoteRevision> custom({
    Expression<String>? id,
    Expression<String>? noteId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? category,
    Expression<int>? revisionNumber,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (category != null) 'category': category,
      if (revisionNumber != null) 'revision_number': revisionNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NoteRevisionsCompanion copyWith({
    Value<String>? id,
    Value<String>? noteId,
    Value<String>? title,
    Value<String?>? content,
    Value<String?>? category,
    Value<int>? revisionNumber,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return NoteRevisionsCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      revisionNumber: revisionNumber ?? this.revisionNumber,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<String>(noteId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (revisionNumber.present) {
      map['revision_number'] = Variable<int>(revisionNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteRevisionsCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('revisionNumber: $revisionNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecurrenceExceptionsTable extends RecurrenceExceptions
    with TableInfo<$RecurrenceExceptionsTable, RecurrenceException> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecurrenceExceptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exceptionKeyMeta = const VerificationMeta(
    'exceptionKey',
  );
  @override
  late final GeneratedColumn<String> exceptionKey = GeneratedColumn<String>(
    'exception_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exceptionTypeMeta = const VerificationMeta(
    'exceptionType',
  );
  @override
  late final GeneratedColumn<String> exceptionType = GeneratedColumn<String>(
    'exception_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modifiedGcDateMeta = const VerificationMeta(
    'modifiedGcDate',
  );
  @override
  late final GeneratedColumn<DateTime> modifiedGcDate =
      GeneratedColumn<DateTime>(
        'modified_gc_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _modifiedEcDateMeta = const VerificationMeta(
    'modifiedEcDate',
  );
  @override
  late final GeneratedColumn<DateTime> modifiedEcDate =
      GeneratedColumn<DateTime>(
        'modified_ec_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverVersionMeta = const VerificationMeta(
    'serverVersion',
  );
  @override
  late final GeneratedColumn<int> serverVersion = GeneratedColumn<int>(
    'server_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _lastOperationIdMeta = const VerificationMeta(
    'lastOperationId',
  );
  @override
  late final GeneratedColumn<String> lastOperationId = GeneratedColumn<String>(
    'last_operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    exceptionKey,
    exceptionType,
    modifiedGcDate,
    modifiedEcDate,
    createdAt,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recurrence_exceptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecurrenceException> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('exception_key')) {
      context.handle(
        _exceptionKeyMeta,
        exceptionKey.isAcceptableOrUnknown(
          data['exception_key']!,
          _exceptionKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exceptionKeyMeta);
    }
    if (data.containsKey('exception_type')) {
      context.handle(
        _exceptionTypeMeta,
        exceptionType.isAcceptableOrUnknown(
          data['exception_type']!,
          _exceptionTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exceptionTypeMeta);
    }
    if (data.containsKey('modified_gc_date')) {
      context.handle(
        _modifiedGcDateMeta,
        modifiedGcDate.isAcceptableOrUnknown(
          data['modified_gc_date']!,
          _modifiedGcDateMeta,
        ),
      );
    }
    if (data.containsKey('modified_ec_date')) {
      context.handle(
        _modifiedEcDateMeta,
        modifiedEcDate.isAcceptableOrUnknown(
          data['modified_ec_date']!,
          _modifiedEcDateMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('server_version')) {
      context.handle(
        _serverVersionMeta,
        serverVersion.isAcceptableOrUnknown(
          data['server_version']!,
          _serverVersionMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_operation_id')) {
      context.handle(
        _lastOperationIdMeta,
        lastOperationId.isAcceptableOrUnknown(
          data['last_operation_id']!,
          _lastOperationIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {exceptionKey},
  ];
  @override
  RecurrenceException map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecurrenceException(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      exceptionKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exception_key'],
      )!,
      exceptionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exception_type'],
      )!,
      modifiedGcDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}modified_gc_date'],
      ),
      modifiedEcDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}modified_ec_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      serverVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_version'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastOperationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_operation_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $RecurrenceExceptionsTable createAlias(String alias) {
    return $RecurrenceExceptionsTable(attachedDatabase, alias);
  }
}

class RecurrenceException extends DataClass
    implements Insertable<RecurrenceException> {
  /// Unique exception ID (UUID).
  final String id;

  /// The entity type: 'event' or 'reminder'.
  final String entityType;

  /// The entity ID of the recurring event/reminder.
  final String entityId;

  /// Composite key: `{entityId}_{occurrenceTimestamp}` for fast lookup.
  final String exceptionKey;

  /// Exception type: 'skipped' or 'modified'.
  final String exceptionType;

  /// For 'modified' exceptions: the new GC date for this occurrence.
  /// Null for 'skipped' exceptions.
  final DateTime? modifiedGcDate;

  /// For 'modified' exceptions: the new EC date for this occurrence.
  final DateTime? modifiedEcDate;

  /// When this exception was created.
  final DateTime createdAt;

  /// Sync metadata.
  final String? accountId;
  final int serverVersion;
  final String syncStatus;
  final String? lastOperationId;
  final DateTime? deletedAt;
  const RecurrenceException({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.exceptionKey,
    required this.exceptionType,
    this.modifiedGcDate,
    this.modifiedEcDate,
    required this.createdAt,
    this.accountId,
    required this.serverVersion,
    required this.syncStatus,
    this.lastOperationId,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['exception_key'] = Variable<String>(exceptionKey);
    map['exception_type'] = Variable<String>(exceptionType);
    if (!nullToAbsent || modifiedGcDate != null) {
      map['modified_gc_date'] = Variable<DateTime>(modifiedGcDate);
    }
    if (!nullToAbsent || modifiedEcDate != null) {
      map['modified_ec_date'] = Variable<DateTime>(modifiedEcDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    map['server_version'] = Variable<int>(serverVersion);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastOperationId != null) {
      map['last_operation_id'] = Variable<String>(lastOperationId);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  RecurrenceExceptionsCompanion toCompanion(bool nullToAbsent) {
    return RecurrenceExceptionsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      exceptionKey: Value(exceptionKey),
      exceptionType: Value(exceptionType),
      modifiedGcDate: modifiedGcDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedGcDate),
      modifiedEcDate: modifiedEcDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedEcDate),
      createdAt: Value(createdAt),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      serverVersion: Value(serverVersion),
      syncStatus: Value(syncStatus),
      lastOperationId: lastOperationId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastOperationId),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory RecurrenceException.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecurrenceException(
      id: serializer.fromJson<String>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      exceptionKey: serializer.fromJson<String>(json['exceptionKey']),
      exceptionType: serializer.fromJson<String>(json['exceptionType']),
      modifiedGcDate: serializer.fromJson<DateTime?>(json['modifiedGcDate']),
      modifiedEcDate: serializer.fromJson<DateTime?>(json['modifiedEcDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      serverVersion: serializer.fromJson<int>(json['serverVersion']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastOperationId: serializer.fromJson<String?>(json['lastOperationId']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'exceptionKey': serializer.toJson<String>(exceptionKey),
      'exceptionType': serializer.toJson<String>(exceptionType),
      'modifiedGcDate': serializer.toJson<DateTime?>(modifiedGcDate),
      'modifiedEcDate': serializer.toJson<DateTime?>(modifiedEcDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'accountId': serializer.toJson<String?>(accountId),
      'serverVersion': serializer.toJson<int>(serverVersion),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastOperationId': serializer.toJson<String?>(lastOperationId),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  RecurrenceException copyWith({
    String? id,
    String? entityType,
    String? entityId,
    String? exceptionKey,
    String? exceptionType,
    Value<DateTime?> modifiedGcDate = const Value.absent(),
    Value<DateTime?> modifiedEcDate = const Value.absent(),
    DateTime? createdAt,
    Value<String?> accountId = const Value.absent(),
    int? serverVersion,
    String? syncStatus,
    Value<String?> lastOperationId = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => RecurrenceException(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    exceptionKey: exceptionKey ?? this.exceptionKey,
    exceptionType: exceptionType ?? this.exceptionType,
    modifiedGcDate: modifiedGcDate.present
        ? modifiedGcDate.value
        : this.modifiedGcDate,
    modifiedEcDate: modifiedEcDate.present
        ? modifiedEcDate.value
        : this.modifiedEcDate,
    createdAt: createdAt ?? this.createdAt,
    accountId: accountId.present ? accountId.value : this.accountId,
    serverVersion: serverVersion ?? this.serverVersion,
    syncStatus: syncStatus ?? this.syncStatus,
    lastOperationId: lastOperationId.present
        ? lastOperationId.value
        : this.lastOperationId,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  RecurrenceException copyWithCompanion(RecurrenceExceptionsCompanion data) {
    return RecurrenceException(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      exceptionKey: data.exceptionKey.present
          ? data.exceptionKey.value
          : this.exceptionKey,
      exceptionType: data.exceptionType.present
          ? data.exceptionType.value
          : this.exceptionType,
      modifiedGcDate: data.modifiedGcDate.present
          ? data.modifiedGcDate.value
          : this.modifiedGcDate,
      modifiedEcDate: data.modifiedEcDate.present
          ? data.modifiedEcDate.value
          : this.modifiedEcDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastOperationId: data.lastOperationId.present
          ? data.lastOperationId.value
          : this.lastOperationId,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecurrenceException(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('exceptionKey: $exceptionKey, ')
          ..write('exceptionType: $exceptionType, ')
          ..write('modifiedGcDate: $modifiedGcDate, ')
          ..write('modifiedEcDate: $modifiedEcDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    exceptionKey,
    exceptionType,
    modifiedGcDate,
    modifiedEcDate,
    createdAt,
    accountId,
    serverVersion,
    syncStatus,
    lastOperationId,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecurrenceException &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.exceptionKey == this.exceptionKey &&
          other.exceptionType == this.exceptionType &&
          other.modifiedGcDate == this.modifiedGcDate &&
          other.modifiedEcDate == this.modifiedEcDate &&
          other.createdAt == this.createdAt &&
          other.accountId == this.accountId &&
          other.serverVersion == this.serverVersion &&
          other.syncStatus == this.syncStatus &&
          other.lastOperationId == this.lastOperationId &&
          other.deletedAt == this.deletedAt);
}

class RecurrenceExceptionsCompanion
    extends UpdateCompanion<RecurrenceException> {
  final Value<String> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> exceptionKey;
  final Value<String> exceptionType;
  final Value<DateTime?> modifiedGcDate;
  final Value<DateTime?> modifiedEcDate;
  final Value<DateTime> createdAt;
  final Value<String?> accountId;
  final Value<int> serverVersion;
  final Value<String> syncStatus;
  final Value<String?> lastOperationId;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const RecurrenceExceptionsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.exceptionKey = const Value.absent(),
    this.exceptionType = const Value.absent(),
    this.modifiedGcDate = const Value.absent(),
    this.modifiedEcDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecurrenceExceptionsCompanion.insert({
    required String id,
    required String entityType,
    required String entityId,
    required String exceptionKey,
    required String exceptionType,
    this.modifiedGcDate = const Value.absent(),
    this.modifiedEcDate = const Value.absent(),
    required DateTime createdAt,
    this.accountId = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastOperationId = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entityType = Value(entityType),
       entityId = Value(entityId),
       exceptionKey = Value(exceptionKey),
       exceptionType = Value(exceptionType),
       createdAt = Value(createdAt);
  static Insertable<RecurrenceException> custom({
    Expression<String>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? exceptionKey,
    Expression<String>? exceptionType,
    Expression<DateTime>? modifiedGcDate,
    Expression<DateTime>? modifiedEcDate,
    Expression<DateTime>? createdAt,
    Expression<String>? accountId,
    Expression<int>? serverVersion,
    Expression<String>? syncStatus,
    Expression<String>? lastOperationId,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (exceptionKey != null) 'exception_key': exceptionKey,
      if (exceptionType != null) 'exception_type': exceptionType,
      if (modifiedGcDate != null) 'modified_gc_date': modifiedGcDate,
      if (modifiedEcDate != null) 'modified_ec_date': modifiedEcDate,
      if (createdAt != null) 'created_at': createdAt,
      if (accountId != null) 'account_id': accountId,
      if (serverVersion != null) 'server_version': serverVersion,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastOperationId != null) 'last_operation_id': lastOperationId,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecurrenceExceptionsCompanion copyWith({
    Value<String>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? exceptionKey,
    Value<String>? exceptionType,
    Value<DateTime?>? modifiedGcDate,
    Value<DateTime?>? modifiedEcDate,
    Value<DateTime>? createdAt,
    Value<String?>? accountId,
    Value<int>? serverVersion,
    Value<String>? syncStatus,
    Value<String?>? lastOperationId,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return RecurrenceExceptionsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      exceptionKey: exceptionKey ?? this.exceptionKey,
      exceptionType: exceptionType ?? this.exceptionType,
      modifiedGcDate: modifiedGcDate ?? this.modifiedGcDate,
      modifiedEcDate: modifiedEcDate ?? this.modifiedEcDate,
      createdAt: createdAt ?? this.createdAt,
      accountId: accountId ?? this.accountId,
      serverVersion: serverVersion ?? this.serverVersion,
      syncStatus: syncStatus ?? this.syncStatus,
      lastOperationId: lastOperationId ?? this.lastOperationId,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (exceptionKey.present) {
      map['exception_key'] = Variable<String>(exceptionKey.value);
    }
    if (exceptionType.present) {
      map['exception_type'] = Variable<String>(exceptionType.value);
    }
    if (modifiedGcDate.present) {
      map['modified_gc_date'] = Variable<DateTime>(modifiedGcDate.value);
    }
    if (modifiedEcDate.present) {
      map['modified_ec_date'] = Variable<DateTime>(modifiedEcDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (serverVersion.present) {
      map['server_version'] = Variable<int>(serverVersion.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastOperationId.present) {
      map['last_operation_id'] = Variable<String>(lastOperationId.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecurrenceExceptionsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('exceptionKey: $exceptionKey, ')
          ..write('exceptionType: $exceptionType, ')
          ..write('modifiedGcDate: $modifiedGcDate, ')
          ..write('modifiedEcDate: $modifiedEcDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('accountId: $accountId, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastOperationId: $lastOperationId, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $PlannerItemsTable plannerItems = $PlannerItemsTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $RecentlyDeletedItemsTable recentlyDeletedItems =
      $RecentlyDeletedItemsTable(this);
  late final $OutboxOperationsTable outboxOperations = $OutboxOperationsTable(
    this,
  );
  late final $NoteRevisionsTable noteRevisions = $NoteRevisionsTable(this);
  late final $RecurrenceExceptionsTable recurrenceExceptions =
      $RecurrenceExceptionsTable(this);
  late final CalendarEventsDao calendarEventsDao = CalendarEventsDao(
    this as AppDatabase,
  );
  late final RemindersDao remindersDao = RemindersDao(this as AppDatabase);
  late final PlannerItemsDao plannerItemsDao = PlannerItemsDao(
    this as AppDatabase,
  );
  late final NotesDao notesDao = NotesDao(this as AppDatabase);
  late final RecentlyDeletedDao recentlyDeletedDao = RecentlyDeletedDao(
    this as AppDatabase,
  );
  late final OutboxDao outboxDao = OutboxDao(this as AppDatabase);
  late final NoteRevisionsDao noteRevisionsDao = NoteRevisionsDao(
    this as AppDatabase,
  );
  late final RecurrenceExceptionsDao recurrenceExceptionsDao =
      RecurrenceExceptionsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    calendarEvents,
    plannerItems,
    reminders,
    notes,
    recentlyDeletedItems,
    outboxOperations,
    noteRevisions,
    recurrenceExceptions,
  ];
}

typedef $$CalendarEventsTableCreateCompanionBuilder =
    CalendarEventsCompanion Function({
      required String id,
      required String title,
      required DateTime ecDate,
      required DateTime gcDate,
      Value<String?> description,
      Value<bool> isAllDay,
      Value<String?> category,
      Value<String?> location,
      Value<String?> recurrenceRule,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$CalendarEventsTableUpdateCompanionBuilder =
    CalendarEventsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<DateTime> ecDate,
      Value<DateTime> gcDate,
      Value<String?> description,
      Value<bool> isAllDay,
      Value<String?> category,
      Value<String?> location,
      Value<String?> recurrenceRule,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$CalendarEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ecDate => $composableBuilder(
    column: $table.ecDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get gcDate => $composableBuilder(
    column: $table.gcDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAllDay => $composableBuilder(
    column: $table.isAllDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get ecDate => $composableBuilder(
    column: $table.ecDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get gcDate => $composableBuilder(
    column: $table.gcDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAllDay => $composableBuilder(
    column: $table.isAllDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get ecDate =>
      $composableBuilder(column: $table.ecDate, builder: (column) => column);

  GeneratedColumn<DateTime> get gcDate =>
      $composableBuilder(column: $table.gcDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAllDay =>
      $composableBuilder(column: $table.isAllDay, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CalendarEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CalendarEventsTable,
          CalendarEvent,
          $$CalendarEventsTableFilterComposer,
          $$CalendarEventsTableOrderingComposer,
          $$CalendarEventsTableAnnotationComposer,
          $$CalendarEventsTableCreateCompanionBuilder,
          $$CalendarEventsTableUpdateCompanionBuilder,
          (
            CalendarEvent,
            BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEvent>,
          ),
          CalendarEvent,
          PrefetchHooks Function()
        > {
  $$CalendarEventsTableTableManager(
    _$AppDatabase db,
    $CalendarEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> ecDate = const Value.absent(),
                Value<DateTime> gcDate = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isAllDay = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> recurrenceRule = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventsCompanion(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                isAllDay: isAllDay,
                category: category,
                location: location,
                recurrenceRule: recurrenceRule,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required DateTime ecDate,
                required DateTime gcDate,
                Value<String?> description = const Value.absent(),
                Value<bool> isAllDay = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> recurrenceRule = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventsCompanion.insert(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                isAllDay: isAllDay,
                category: category,
                location: location,
                recurrenceRule: recurrenceRule,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CalendarEventsTable,
      CalendarEvent,
      $$CalendarEventsTableFilterComposer,
      $$CalendarEventsTableOrderingComposer,
      $$CalendarEventsTableAnnotationComposer,
      $$CalendarEventsTableCreateCompanionBuilder,
      $$CalendarEventsTableUpdateCompanionBuilder,
      (
        CalendarEvent,
        BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEvent>,
      ),
      CalendarEvent,
      PrefetchHooks Function()
    >;
typedef $$PlannerItemsTableCreateCompanionBuilder =
    PlannerItemsCompanion Function({
      required String id,
      required String title,
      required DateTime ecDate,
      required DateTime gcDate,
      Value<String?> description,
      Value<bool> isCompleted,
      Value<String> section,
      Value<int> sortOrder,
      Value<String?> linkedEventId,
      Value<String?> linkedReminderId,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$PlannerItemsTableUpdateCompanionBuilder =
    PlannerItemsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<DateTime> ecDate,
      Value<DateTime> gcDate,
      Value<String?> description,
      Value<bool> isCompleted,
      Value<String> section,
      Value<int> sortOrder,
      Value<String?> linkedEventId,
      Value<String?> linkedReminderId,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$PlannerItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PlannerItemsTable> {
  $$PlannerItemsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ecDate => $composableBuilder(
    column: $table.ecDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get gcDate => $composableBuilder(
    column: $table.gcDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedReminderId => $composableBuilder(
    column: $table.linkedReminderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlannerItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlannerItemsTable> {
  $$PlannerItemsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get ecDate => $composableBuilder(
    column: $table.ecDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get gcDate => $composableBuilder(
    column: $table.gcDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedReminderId => $composableBuilder(
    column: $table.linkedReminderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlannerItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlannerItemsTable> {
  $$PlannerItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get ecDate =>
      $composableBuilder(column: $table.ecDate, builder: (column) => column);

  GeneratedColumn<DateTime> get gcDate =>
      $composableBuilder(column: $table.gcDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get linkedReminderId => $composableBuilder(
    column: $table.linkedReminderId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$PlannerItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlannerItemsTable,
          PlannerItem,
          $$PlannerItemsTableFilterComposer,
          $$PlannerItemsTableOrderingComposer,
          $$PlannerItemsTableAnnotationComposer,
          $$PlannerItemsTableCreateCompanionBuilder,
          $$PlannerItemsTableUpdateCompanionBuilder,
          (
            PlannerItem,
            BaseReferences<_$AppDatabase, $PlannerItemsTable, PlannerItem>,
          ),
          PlannerItem,
          PrefetchHooks Function()
        > {
  $$PlannerItemsTableTableManager(_$AppDatabase db, $PlannerItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlannerItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlannerItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlannerItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> ecDate = const Value.absent(),
                Value<DateTime> gcDate = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String?> linkedEventId = const Value.absent(),
                Value<String?> linkedReminderId = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlannerItemsCompanion(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                isCompleted: isCompleted,
                section: section,
                sortOrder: sortOrder,
                linkedEventId: linkedEventId,
                linkedReminderId: linkedReminderId,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required DateTime ecDate,
                required DateTime gcDate,
                Value<String?> description = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String?> linkedEventId = const Value.absent(),
                Value<String?> linkedReminderId = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlannerItemsCompanion.insert(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                isCompleted: isCompleted,
                section: section,
                sortOrder: sortOrder,
                linkedEventId: linkedEventId,
                linkedReminderId: linkedReminderId,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlannerItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlannerItemsTable,
      PlannerItem,
      $$PlannerItemsTableFilterComposer,
      $$PlannerItemsTableOrderingComposer,
      $$PlannerItemsTableAnnotationComposer,
      $$PlannerItemsTableCreateCompanionBuilder,
      $$PlannerItemsTableUpdateCompanionBuilder,
      (
        PlannerItem,
        BaseReferences<_$AppDatabase, $PlannerItemsTable, PlannerItem>,
      ),
      PlannerItem,
      PrefetchHooks Function()
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      required String id,
      required String title,
      required DateTime ecDate,
      required DateTime gcDate,
      Value<String?> description,
      Value<bool> isCompleted,
      Value<int?> notificationId,
      Value<String?> category,
      Value<String?> linkedEventId,
      Value<String?> recurrenceRule,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<DateTime> ecDate,
      Value<DateTime> gcDate,
      Value<String?> description,
      Value<bool> isCompleted,
      Value<int?> notificationId,
      Value<String?> category,
      Value<String?> linkedEventId,
      Value<String?> recurrenceRule,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ecDate => $composableBuilder(
    column: $table.ecDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get gcDate => $composableBuilder(
    column: $table.gcDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get ecDate => $composableBuilder(
    column: $table.ecDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get gcDate => $composableBuilder(
    column: $table.gcDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get ecDate =>
      $composableBuilder(column: $table.ecDate, builder: (column) => column);

  GeneratedColumn<DateTime> get gcDate =>
      $composableBuilder(column: $table.gcDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, BaseReferences<_$AppDatabase, $RemindersTable, Reminder>),
          Reminder,
          PrefetchHooks Function()
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> ecDate = const Value.absent(),
                Value<DateTime> gcDate = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int?> notificationId = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> linkedEventId = const Value.absent(),
                Value<String?> recurrenceRule = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                isCompleted: isCompleted,
                notificationId: notificationId,
                category: category,
                linkedEventId: linkedEventId,
                recurrenceRule: recurrenceRule,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required DateTime ecDate,
                required DateTime gcDate,
                Value<String?> description = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int?> notificationId = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> linkedEventId = const Value.absent(),
                Value<String?> recurrenceRule = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                isCompleted: isCompleted,
                notificationId: notificationId,
                category: category,
                linkedEventId: linkedEventId,
                recurrenceRule: recurrenceRule,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, BaseReferences<_$AppDatabase, $RemindersTable, Reminder>),
      Reminder,
      PrefetchHooks Function()
    >;
typedef $$NotesTableCreateCompanionBuilder =
    NotesCompanion Function({
      required String id,
      required String title,
      Value<String?> content,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isPinned,
      Value<bool> isArchived,
      Value<String?> category,
      Value<String?> linkedEventId,
      Value<String?> linkedReminderId,
      Value<String?> linkedPlannerItemId,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$NotesTableUpdateCompanionBuilder =
    NotesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isPinned,
      Value<bool> isArchived,
      Value<String?> category,
      Value<String?> linkedEventId,
      Value<String?> linkedReminderId,
      Value<String?> linkedPlannerItemId,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedReminderId => $composableBuilder(
    column: $table.linkedReminderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedPlannerItemId => $composableBuilder(
    column: $table.linkedPlannerItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedReminderId => $composableBuilder(
    column: $table.linkedReminderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedPlannerItemId => $composableBuilder(
    column: $table.linkedPlannerItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get linkedEventId => $composableBuilder(
    column: $table.linkedEventId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get linkedReminderId => $composableBuilder(
    column: $table.linkedReminderId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get linkedPlannerItemId => $composableBuilder(
    column: $table.linkedPlannerItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$NotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotesTable,
          Note,
          $$NotesTableFilterComposer,
          $$NotesTableOrderingComposer,
          $$NotesTableAnnotationComposer,
          $$NotesTableCreateCompanionBuilder,
          $$NotesTableUpdateCompanionBuilder,
          (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
          Note,
          PrefetchHooks Function()
        > {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> linkedEventId = const Value.absent(),
                Value<String?> linkedReminderId = const Value.absent(),
                Value<String?> linkedPlannerItemId = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isPinned: isPinned,
                isArchived: isArchived,
                category: category,
                linkedEventId: linkedEventId,
                linkedReminderId: linkedReminderId,
                linkedPlannerItemId: linkedPlannerItemId,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> content = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isPinned = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> linkedEventId = const Value.absent(),
                Value<String?> linkedReminderId = const Value.absent(),
                Value<String?> linkedPlannerItemId = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion.insert(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isPinned: isPinned,
                isArchived: isArchived,
                category: category,
                linkedEventId: linkedEventId,
                linkedReminderId: linkedReminderId,
                linkedPlannerItemId: linkedPlannerItemId,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotesTable,
      Note,
      $$NotesTableFilterComposer,
      $$NotesTableOrderingComposer,
      $$NotesTableAnnotationComposer,
      $$NotesTableCreateCompanionBuilder,
      $$NotesTableUpdateCompanionBuilder,
      (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
      Note,
      PrefetchHooks Function()
    >;
typedef $$RecentlyDeletedItemsTableCreateCompanionBuilder =
    RecentlyDeletedItemsCompanion Function({
      required String id,
      required String entityType,
      required String entityId,
      required String entityTitle,
      required DateTime deletedAt,
      required String entityData,
      Value<int> rowid,
    });
typedef $$RecentlyDeletedItemsTableUpdateCompanionBuilder =
    RecentlyDeletedItemsCompanion Function({
      Value<String> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> entityTitle,
      Value<DateTime> deletedAt,
      Value<String> entityData,
      Value<int> rowid,
    });

class $$RecentlyDeletedItemsTableFilterComposer
    extends Composer<_$AppDatabase, $RecentlyDeletedItemsTable> {
  $$RecentlyDeletedItemsTableFilterComposer({
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

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityTitle => $composableBuilder(
    column: $table.entityTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityData => $composableBuilder(
    column: $table.entityData,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecentlyDeletedItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecentlyDeletedItemsTable> {
  $$RecentlyDeletedItemsTableOrderingComposer({
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

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityTitle => $composableBuilder(
    column: $table.entityTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityData => $composableBuilder(
    column: $table.entityData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecentlyDeletedItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecentlyDeletedItemsTable> {
  $$RecentlyDeletedItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get entityTitle => $composableBuilder(
    column: $table.entityTitle,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get entityData => $composableBuilder(
    column: $table.entityData,
    builder: (column) => column,
  );
}

class $$RecentlyDeletedItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecentlyDeletedItemsTable,
          RecentlyDeletedItem,
          $$RecentlyDeletedItemsTableFilterComposer,
          $$RecentlyDeletedItemsTableOrderingComposer,
          $$RecentlyDeletedItemsTableAnnotationComposer,
          $$RecentlyDeletedItemsTableCreateCompanionBuilder,
          $$RecentlyDeletedItemsTableUpdateCompanionBuilder,
          (
            RecentlyDeletedItem,
            BaseReferences<
              _$AppDatabase,
              $RecentlyDeletedItemsTable,
              RecentlyDeletedItem
            >,
          ),
          RecentlyDeletedItem,
          PrefetchHooks Function()
        > {
  $$RecentlyDeletedItemsTableTableManager(
    _$AppDatabase db,
    $RecentlyDeletedItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecentlyDeletedItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecentlyDeletedItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecentlyDeletedItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> entityTitle = const Value.absent(),
                Value<DateTime> deletedAt = const Value.absent(),
                Value<String> entityData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecentlyDeletedItemsCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                entityTitle: entityTitle,
                deletedAt: deletedAt,
                entityData: entityData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entityType,
                required String entityId,
                required String entityTitle,
                required DateTime deletedAt,
                required String entityData,
                Value<int> rowid = const Value.absent(),
              }) => RecentlyDeletedItemsCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                entityTitle: entityTitle,
                deletedAt: deletedAt,
                entityData: entityData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecentlyDeletedItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecentlyDeletedItemsTable,
      RecentlyDeletedItem,
      $$RecentlyDeletedItemsTableFilterComposer,
      $$RecentlyDeletedItemsTableOrderingComposer,
      $$RecentlyDeletedItemsTableAnnotationComposer,
      $$RecentlyDeletedItemsTableCreateCompanionBuilder,
      $$RecentlyDeletedItemsTableUpdateCompanionBuilder,
      (
        RecentlyDeletedItem,
        BaseReferences<
          _$AppDatabase,
          $RecentlyDeletedItemsTable,
          RecentlyDeletedItem
        >,
      ),
      RecentlyDeletedItem,
      PrefetchHooks Function()
    >;
typedef $$OutboxOperationsTableCreateCompanionBuilder =
    OutboxOperationsCompanion Function({
      required String id,
      required String entityType,
      required String entityId,
      required String operationType,
      Value<String?> payload,
      required DateTime createdAt,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime?> lastAttemptAt,
      Value<String?> accountId,
      Value<int> rowid,
    });
typedef $$OutboxOperationsTableUpdateCompanionBuilder =
    OutboxOperationsCompanion Function({
      Value<String> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> operationType,
      Value<String?> payload,
      Value<DateTime> createdAt,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime?> lastAttemptAt,
      Value<String?> accountId,
      Value<int> rowid,
    });

class $$OutboxOperationsTableFilterComposer
    extends Composer<_$AppDatabase, $OutboxOperationsTable> {
  $$OutboxOperationsTableFilterComposer({
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

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OutboxOperationsTableOrderingComposer
    extends Composer<_$AppDatabase, $OutboxOperationsTable> {
  $$OutboxOperationsTableOrderingComposer({
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

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OutboxOperationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutboxOperationsTable> {
  $$OutboxOperationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);
}

class $$OutboxOperationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OutboxOperationsTable,
          OutboxOperation,
          $$OutboxOperationsTableFilterComposer,
          $$OutboxOperationsTableOrderingComposer,
          $$OutboxOperationsTableAnnotationComposer,
          $$OutboxOperationsTableCreateCompanionBuilder,
          $$OutboxOperationsTableUpdateCompanionBuilder,
          (
            OutboxOperation,
            BaseReferences<
              _$AppDatabase,
              $OutboxOperationsTable,
              OutboxOperation
            >,
          ),
          OutboxOperation,
          PrefetchHooks Function()
        > {
  $$OutboxOperationsTableTableManager(
    _$AppDatabase db,
    $OutboxOperationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboxOperationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutboxOperationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutboxOperationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> operationType = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OutboxOperationsCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operationType: operationType,
                payload: payload,
                createdAt: createdAt,
                retryCount: retryCount,
                lastError: lastError,
                lastAttemptAt: lastAttemptAt,
                accountId: accountId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entityType,
                required String entityId,
                required String operationType,
                Value<String?> payload = const Value.absent(),
                required DateTime createdAt,
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OutboxOperationsCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operationType: operationType,
                payload: payload,
                createdAt: createdAt,
                retryCount: retryCount,
                lastError: lastError,
                lastAttemptAt: lastAttemptAt,
                accountId: accountId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OutboxOperationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OutboxOperationsTable,
      OutboxOperation,
      $$OutboxOperationsTableFilterComposer,
      $$OutboxOperationsTableOrderingComposer,
      $$OutboxOperationsTableAnnotationComposer,
      $$OutboxOperationsTableCreateCompanionBuilder,
      $$OutboxOperationsTableUpdateCompanionBuilder,
      (
        OutboxOperation,
        BaseReferences<_$AppDatabase, $OutboxOperationsTable, OutboxOperation>,
      ),
      OutboxOperation,
      PrefetchHooks Function()
    >;
typedef $$NoteRevisionsTableCreateCompanionBuilder =
    NoteRevisionsCompanion Function({
      required String id,
      required String noteId,
      required String title,
      Value<String?> content,
      Value<String?> category,
      required int revisionNumber,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$NoteRevisionsTableUpdateCompanionBuilder =
    NoteRevisionsCompanion Function({
      Value<String> id,
      Value<String> noteId,
      Value<String> title,
      Value<String?> content,
      Value<String?> category,
      Value<int> revisionNumber,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$NoteRevisionsTableFilterComposer
    extends Composer<_$AppDatabase, $NoteRevisionsTable> {
  $$NoteRevisionsTableFilterComposer({
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

  ColumnFilters<String> get noteId => $composableBuilder(
    column: $table.noteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revisionNumber => $composableBuilder(
    column: $table.revisionNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NoteRevisionsTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteRevisionsTable> {
  $$NoteRevisionsTableOrderingComposer({
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

  ColumnOrderings<String> get noteId => $composableBuilder(
    column: $table.noteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revisionNumber => $composableBuilder(
    column: $table.revisionNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NoteRevisionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteRevisionsTable> {
  $$NoteRevisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get noteId =>
      $composableBuilder(column: $table.noteId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get revisionNumber => $composableBuilder(
    column: $table.revisionNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$NoteRevisionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NoteRevisionsTable,
          NoteRevision,
          $$NoteRevisionsTableFilterComposer,
          $$NoteRevisionsTableOrderingComposer,
          $$NoteRevisionsTableAnnotationComposer,
          $$NoteRevisionsTableCreateCompanionBuilder,
          $$NoteRevisionsTableUpdateCompanionBuilder,
          (
            NoteRevision,
            BaseReferences<_$AppDatabase, $NoteRevisionsTable, NoteRevision>,
          ),
          NoteRevision,
          PrefetchHooks Function()
        > {
  $$NoteRevisionsTableTableManager(_$AppDatabase db, $NoteRevisionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteRevisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteRevisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteRevisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> noteId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int> revisionNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NoteRevisionsCompanion(
                id: id,
                noteId: noteId,
                title: title,
                content: content,
                category: category,
                revisionNumber: revisionNumber,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String noteId,
                required String title,
                Value<String?> content = const Value.absent(),
                Value<String?> category = const Value.absent(),
                required int revisionNumber,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => NoteRevisionsCompanion.insert(
                id: id,
                noteId: noteId,
                title: title,
                content: content,
                category: category,
                revisionNumber: revisionNumber,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NoteRevisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NoteRevisionsTable,
      NoteRevision,
      $$NoteRevisionsTableFilterComposer,
      $$NoteRevisionsTableOrderingComposer,
      $$NoteRevisionsTableAnnotationComposer,
      $$NoteRevisionsTableCreateCompanionBuilder,
      $$NoteRevisionsTableUpdateCompanionBuilder,
      (
        NoteRevision,
        BaseReferences<_$AppDatabase, $NoteRevisionsTable, NoteRevision>,
      ),
      NoteRevision,
      PrefetchHooks Function()
    >;
typedef $$RecurrenceExceptionsTableCreateCompanionBuilder =
    RecurrenceExceptionsCompanion Function({
      required String id,
      required String entityType,
      required String entityId,
      required String exceptionKey,
      required String exceptionType,
      Value<DateTime?> modifiedGcDate,
      Value<DateTime?> modifiedEcDate,
      required DateTime createdAt,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$RecurrenceExceptionsTableUpdateCompanionBuilder =
    RecurrenceExceptionsCompanion Function({
      Value<String> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> exceptionKey,
      Value<String> exceptionType,
      Value<DateTime?> modifiedGcDate,
      Value<DateTime?> modifiedEcDate,
      Value<DateTime> createdAt,
      Value<String?> accountId,
      Value<int> serverVersion,
      Value<String> syncStatus,
      Value<String?> lastOperationId,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

class $$RecurrenceExceptionsTableFilterComposer
    extends Composer<_$AppDatabase, $RecurrenceExceptionsTable> {
  $$RecurrenceExceptionsTableFilterComposer({
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

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exceptionKey => $composableBuilder(
    column: $table.exceptionKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exceptionType => $composableBuilder(
    column: $table.exceptionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get modifiedGcDate => $composableBuilder(
    column: $table.modifiedGcDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get modifiedEcDate => $composableBuilder(
    column: $table.modifiedEcDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecurrenceExceptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecurrenceExceptionsTable> {
  $$RecurrenceExceptionsTableOrderingComposer({
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

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exceptionKey => $composableBuilder(
    column: $table.exceptionKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exceptionType => $composableBuilder(
    column: $table.exceptionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get modifiedGcDate => $composableBuilder(
    column: $table.modifiedGcDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get modifiedEcDate => $composableBuilder(
    column: $table.modifiedEcDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecurrenceExceptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecurrenceExceptionsTable> {
  $$RecurrenceExceptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get exceptionKey => $composableBuilder(
    column: $table.exceptionKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exceptionType => $composableBuilder(
    column: $table.exceptionType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get modifiedGcDate => $composableBuilder(
    column: $table.modifiedGcDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get modifiedEcDate => $composableBuilder(
    column: $table.modifiedEcDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastOperationId => $composableBuilder(
    column: $table.lastOperationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$RecurrenceExceptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecurrenceExceptionsTable,
          RecurrenceException,
          $$RecurrenceExceptionsTableFilterComposer,
          $$RecurrenceExceptionsTableOrderingComposer,
          $$RecurrenceExceptionsTableAnnotationComposer,
          $$RecurrenceExceptionsTableCreateCompanionBuilder,
          $$RecurrenceExceptionsTableUpdateCompanionBuilder,
          (
            RecurrenceException,
            BaseReferences<
              _$AppDatabase,
              $RecurrenceExceptionsTable,
              RecurrenceException
            >,
          ),
          RecurrenceException,
          PrefetchHooks Function()
        > {
  $$RecurrenceExceptionsTableTableManager(
    _$AppDatabase db,
    $RecurrenceExceptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecurrenceExceptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecurrenceExceptionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecurrenceExceptionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> exceptionKey = const Value.absent(),
                Value<String> exceptionType = const Value.absent(),
                Value<DateTime?> modifiedGcDate = const Value.absent(),
                Value<DateTime?> modifiedEcDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecurrenceExceptionsCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                exceptionKey: exceptionKey,
                exceptionType: exceptionType,
                modifiedGcDate: modifiedGcDate,
                modifiedEcDate: modifiedEcDate,
                createdAt: createdAt,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entityType,
                required String entityId,
                required String exceptionKey,
                required String exceptionType,
                Value<DateTime?> modifiedGcDate = const Value.absent(),
                Value<DateTime?> modifiedEcDate = const Value.absent(),
                required DateTime createdAt,
                Value<String?> accountId = const Value.absent(),
                Value<int> serverVersion = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastOperationId = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecurrenceExceptionsCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                exceptionKey: exceptionKey,
                exceptionType: exceptionType,
                modifiedGcDate: modifiedGcDate,
                modifiedEcDate: modifiedEcDate,
                createdAt: createdAt,
                accountId: accountId,
                serverVersion: serverVersion,
                syncStatus: syncStatus,
                lastOperationId: lastOperationId,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecurrenceExceptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecurrenceExceptionsTable,
      RecurrenceException,
      $$RecurrenceExceptionsTableFilterComposer,
      $$RecurrenceExceptionsTableOrderingComposer,
      $$RecurrenceExceptionsTableAnnotationComposer,
      $$RecurrenceExceptionsTableCreateCompanionBuilder,
      $$RecurrenceExceptionsTableUpdateCompanionBuilder,
      (
        RecurrenceException,
        BaseReferences<
          _$AppDatabase,
          $RecurrenceExceptionsTable,
          RecurrenceException
        >,
      ),
      RecurrenceException,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$PlannerItemsTableTableManager get plannerItems =>
      $$PlannerItemsTableTableManager(_db, _db.plannerItems);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$RecentlyDeletedItemsTableTableManager get recentlyDeletedItems =>
      $$RecentlyDeletedItemsTableTableManager(_db, _db.recentlyDeletedItems);
  $$OutboxOperationsTableTableManager get outboxOperations =>
      $$OutboxOperationsTableTableManager(_db, _db.outboxOperations);
  $$NoteRevisionsTableTableManager get noteRevisions =>
      $$NoteRevisionsTableTableManager(_db, _db.noteRevisions);
  $$RecurrenceExceptionsTableTableManager get recurrenceExceptions =>
      $$RecurrenceExceptionsTableTableManager(_db, _db.recurrenceExceptions);
}
