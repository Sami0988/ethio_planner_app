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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    ecDate,
    gcDate,
    description,
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
  const CalendarEvent({
    required this.id,
    required this.title,
    required this.ecDate,
    required this.gcDate,
    this.description,
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
    };
  }

  CalendarEvent copyWith({
    String? id,
    String? title,
    DateTime? ecDate,
    DateTime? gcDate,
    Value<String?> description = const Value.absent(),
  }) => CalendarEvent(
    id: id ?? this.id,
    title: title ?? this.title,
    ecDate: ecDate ?? this.ecDate,
    gcDate: gcDate ?? this.gcDate,
    description: description.present ? description.value : this.description,
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEvent(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ecDate: $ecDate, ')
          ..write('gcDate: $gcDate, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, ecDate, gcDate, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEvent &&
          other.id == this.id &&
          other.title == this.title &&
          other.ecDate == this.ecDate &&
          other.gcDate == this.gcDate &&
          other.description == this.description);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEvent> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> ecDate;
  final Value<DateTime> gcDate;
  final Value<String?> description;
  final Value<int> rowid;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.ecDate = const Value.absent(),
    this.gcDate = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    this.description = const Value.absent(),
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
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (ecDate != null) 'ec_date': ecDate,
      if (gcDate != null) 'gc_date': gcDate,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<DateTime>? ecDate,
    Value<DateTime>? gcDate,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      ecDate: ecDate ?? this.ecDate,
      gcDate: gcDate ?? this.gcDate,
      description: description ?? this.description,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    ecDate,
    gcDate,
    description,
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
  const PlannerItem({
    required this.id,
    required this.title,
    required this.ecDate,
    required this.gcDate,
    this.description,
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
    };
  }

  PlannerItem copyWith({
    String? id,
    String? title,
    DateTime? ecDate,
    DateTime? gcDate,
    Value<String?> description = const Value.absent(),
  }) => PlannerItem(
    id: id ?? this.id,
    title: title ?? this.title,
    ecDate: ecDate ?? this.ecDate,
    gcDate: gcDate ?? this.gcDate,
    description: description.present ? description.value : this.description,
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlannerItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ecDate: $ecDate, ')
          ..write('gcDate: $gcDate, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, ecDate, gcDate, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlannerItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.ecDate == this.ecDate &&
          other.gcDate == this.gcDate &&
          other.description == this.description);
}

class PlannerItemsCompanion extends UpdateCompanion<PlannerItem> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> ecDate;
  final Value<DateTime> gcDate;
  final Value<String?> description;
  final Value<int> rowid;
  const PlannerItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.ecDate = const Value.absent(),
    this.gcDate = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannerItemsCompanion.insert({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    this.description = const Value.absent(),
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
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (ecDate != null) 'ec_date': ecDate,
      if (gcDate != null) 'gc_date': gcDate,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannerItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<DateTime>? ecDate,
    Value<DateTime>? gcDate,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return PlannerItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      ecDate: ecDate ?? this.ecDate,
      gcDate: gcDate ?? this.gcDate,
      description: description ?? this.description,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    ecDate,
    gcDate,
    description,
    isCompleted,
    notificationId,
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
  const Reminder({
    required this.id,
    required this.title,
    required this.ecDate,
    required this.gcDate,
    this.description,
    required this.isCompleted,
    this.notificationId,
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
          ..write('notificationId: $notificationId')
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
          other.notificationId == this.notificationId);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> ecDate;
  final Value<DateTime> gcDate;
  final Value<String?> description;
  final Value<bool> isCompleted;
  final Value<int?> notificationId;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.ecDate = const Value.absent(),
    this.gcDate = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.notificationId = const Value.absent(),
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
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrintJobsTable extends PrintJobs
    with TableInfo<$PrintJobsTable, PrintJob> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrintJobsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, createdAt, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'print_jobs';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrintJob> instance, {
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrintJob map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrintJob(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $PrintJobsTable createAlias(String alias) {
    return $PrintJobsTable(attachedDatabase, alias);
  }
}

class PrintJob extends DataClass implements Insertable<PrintJob> {
  final String id;
  final String title;
  final DateTime createdAt;
  final String status;
  const PrintJob({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<String>(status);
    return map;
  }

  PrintJobsCompanion toCompanion(bool nullToAbsent) {
    return PrintJobsCompanion(
      id: Value(id),
      title: Value(title),
      createdAt: Value(createdAt),
      status: Value(status),
    );
  }

  factory PrintJob.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrintJob(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<String>(status),
    };
  }

  PrintJob copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    String? status,
  }) => PrintJob(
    id: id ?? this.id,
    title: title ?? this.title,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
  );
  PrintJob copyWithCompanion(PrintJobsCompanion data) {
    return PrintJob(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrintJob(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, createdAt, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrintJob &&
          other.id == this.id &&
          other.title == this.title &&
          other.createdAt == this.createdAt &&
          other.status == this.status);
}

class PrintJobsCompanion extends UpdateCompanion<PrintJob> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> createdAt;
  final Value<String> status;
  final Value<int> rowid;
  const PrintJobsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrintJobsCompanion.insert({
    required String id,
    required String title,
    required DateTime createdAt,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt);
  static Insertable<PrintJob> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? createdAt,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrintJobsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<DateTime>? createdAt,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return PrintJobsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrintJobsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
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
  late final $PrintJobsTable printJobs = $PrintJobsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    calendarEvents,
    plannerItems,
    reminders,
    printJobs,
  ];
}

typedef $$CalendarEventsTableCreateCompanionBuilder =
    CalendarEventsCompanion Function({
      required String id,
      required String title,
      required DateTime ecDate,
      required DateTime gcDate,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$CalendarEventsTableUpdateCompanionBuilder =
    CalendarEventsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<DateTime> ecDate,
      Value<DateTime> gcDate,
      Value<String?> description,
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
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventsCompanion(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required DateTime ecDate,
                required DateTime gcDate,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventsCompanion.insert(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
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
      Value<int> rowid,
    });
typedef $$PlannerItemsTableUpdateCompanionBuilder =
    PlannerItemsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<DateTime> ecDate,
      Value<DateTime> gcDate,
      Value<String?> description,
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
                Value<int> rowid = const Value.absent(),
              }) => PlannerItemsCompanion(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required DateTime ecDate,
                required DateTime gcDate,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlannerItemsCompanion.insert(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
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
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                isCompleted: isCompleted,
                notificationId: notificationId,
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
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                title: title,
                ecDate: ecDate,
                gcDate: gcDate,
                description: description,
                isCompleted: isCompleted,
                notificationId: notificationId,
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
typedef $$PrintJobsTableCreateCompanionBuilder =
    PrintJobsCompanion Function({
      required String id,
      required String title,
      required DateTime createdAt,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$PrintJobsTableUpdateCompanionBuilder =
    PrintJobsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<DateTime> createdAt,
      Value<String> status,
      Value<int> rowid,
    });

class $$PrintJobsTableFilterComposer
    extends Composer<_$AppDatabase, $PrintJobsTable> {
  $$PrintJobsTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrintJobsTableOrderingComposer
    extends Composer<_$AppDatabase, $PrintJobsTable> {
  $$PrintJobsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrintJobsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrintJobsTable> {
  $$PrintJobsTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$PrintJobsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrintJobsTable,
          PrintJob,
          $$PrintJobsTableFilterComposer,
          $$PrintJobsTableOrderingComposer,
          $$PrintJobsTableAnnotationComposer,
          $$PrintJobsTableCreateCompanionBuilder,
          $$PrintJobsTableUpdateCompanionBuilder,
          (PrintJob, BaseReferences<_$AppDatabase, $PrintJobsTable, PrintJob>),
          PrintJob,
          PrefetchHooks Function()
        > {
  $$PrintJobsTableTableManager(_$AppDatabase db, $PrintJobsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrintJobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrintJobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrintJobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrintJobsCompanion(
                id: id,
                title: title,
                createdAt: createdAt,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required DateTime createdAt,
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrintJobsCompanion.insert(
                id: id,
                title: title,
                createdAt: createdAt,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrintJobsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrintJobsTable,
      PrintJob,
      $$PrintJobsTableFilterComposer,
      $$PrintJobsTableOrderingComposer,
      $$PrintJobsTableAnnotationComposer,
      $$PrintJobsTableCreateCompanionBuilder,
      $$PrintJobsTableUpdateCompanionBuilder,
      (PrintJob, BaseReferences<_$AppDatabase, $PrintJobsTable, PrintJob>),
      PrintJob,
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
  $$PrintJobsTableTableManager get printJobs =>
      $$PrintJobsTableTableManager(_db, _db.printJobs);
}
