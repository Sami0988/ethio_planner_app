import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'reminders_dao.g.dart';

@DriftAccessor(tables: [Reminders])
class RemindersDao extends DatabaseAccessor<AppDatabase>
    with _$RemindersDaoMixin {
  RemindersDao(AppDatabase db) : super(db);

  Future<int> insertReminder(RemindersCompanion reminder) {
    return into(reminders)
        .insert(reminder, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateReminder(RemindersCompanion reminder) {
    return update(reminders).replace(reminder);
  }

  Future<int> deleteReminder(String id) {
    return (delete(reminders)..where((t) => t.id.equals(id))).go();
  }

  Future<Reminder?> getReminderById(String id) {
    return (select(reminders)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<Reminder>> getRemindersByDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(reminders)
          ..where((t) => t.gcDate.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Future<List<Reminder>> getOverdueReminders() {
    final now = DateTime.now();
    return (select(reminders)
          ..where((t) =>
              t.gcDate.isSmallerThanValue(now) &
              t.isCompleted.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Future<List<Reminder>> getUpcomingReminders() {
    final now = DateTime.now();
    return (select(reminders)
          ..where((t) =>
              t.gcDate.isBiggerOrEqualValue(now) &
              t.isCompleted.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Future<List<Reminder>> getCompletedReminders() {
    return (select(reminders)
          ..where((t) => t.isCompleted.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.gcDate)]))
        .get();
  }

  Future<List<Reminder>> getAllReminders() {
    return (select(reminders)
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Future<void> toggleCompleted(String id, bool isCompleted) async {
    await (update(reminders)..where((t) => t.id.equals(id))).write(
      RemindersCompanion(isCompleted: Value(isCompleted)),
    );
  }

  Stream<List<Reminder>> watchAllReminders() {
    return (select(reminders)
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .watch();
  }

  Stream<List<Reminder>> watchUpcomingReminders() {
    final now = DateTime.now();
    return (select(reminders)
          ..where((t) =>
              t.gcDate.isBiggerOrEqualValue(now) &
              t.isCompleted.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .watch();
  }
}
