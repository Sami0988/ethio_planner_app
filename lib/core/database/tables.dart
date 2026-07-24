import 'package:drift/drift.dart';

class CalendarEvents extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get ecDate => dateTime()();
  DateTimeColumn get gcDate => dateTime()();
  TextColumn get description => text().nullable()();
  BoolColumn get isAllDay => boolean().withDefault(const Constant(false))();
  TextColumn get category => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get recurrenceRule => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class PlannerItems extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get ecDate => dateTime()();
  DateTimeColumn get gcDate => dateTime()();
  TextColumn get description => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get section => text().withDefault(const Constant('focus'))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  TextColumn get linkedEventId => text().nullable()();
  TextColumn get linkedReminderId => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Reminders extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get ecDate => dateTime()();
  DateTimeColumn get gcDate => dateTime()();
  TextColumn get description => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get notificationId => integer().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get linkedEventId => text().nullable()();
  TextColumn get recurrenceRule => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Notes extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  TextColumn get category => text().nullable()();
  TextColumn get linkedEventId => text().nullable()();
  TextColumn get linkedReminderId => text().nullable()();
  TextColumn get linkedPlannerItemId => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class RecentlyDeletedItems extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get entityTitle => text()();
  DateTimeColumn get deletedAt => dateTime()();
  TextColumn get entityData => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class PrintJobs extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get status => text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
