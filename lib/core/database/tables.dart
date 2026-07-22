import 'package:drift/drift.dart';

class CalendarEvents extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get ecDate => dateTime()();
  DateTimeColumn get gcDate => dateTime()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class PlannerItems extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get ecDate => dateTime()();
  DateTimeColumn get gcDate => dateTime()();
  TextColumn get description => text().nullable()();

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
