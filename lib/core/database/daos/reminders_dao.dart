import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'reminders_dao.g.dart';

@DriftAccessor(tables: [Reminders])
class RemindersDao extends DatabaseAccessor<AppDatabase>
    with _$RemindersDaoMixin {
  RemindersDao(super.db);

  Future<int> insertReminder(RemindersCompanion reminder) {
    return into(reminders).insert(reminder, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateReminder(RemindersCompanion reminder) {
    return update(reminders).replace(reminder);
  }

  Future<int> deleteReminder(String id) {
    return (delete(reminders)..where((t) => t.id.equals(id))).go();
  }

  Future<Reminder?> getReminderById(String id) {
    return (select(reminders)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<Reminder>> getRemindersByDate(
    DateTime date, {
    String? accountId,
  }) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    final query = select(reminders)
      ..where((t) => t.gcDate.isBetweenValues(start, end));
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    return query.get();
  }

  Future<List<Reminder>> getOverdueReminders({String? accountId}) {
    final now = DateTime.now();
    final query = select(reminders)
      ..where(
        (t) => t.gcDate.isSmallerThanValue(now) & t.isCompleted.equals(false),
      );
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    return query.get();
  }

  Future<List<Reminder>> getUpcomingReminders({String? accountId}) {
    final now = DateTime.now();
    final query = select(reminders)
      ..where(
        (t) => t.gcDate.isBiggerOrEqualValue(now) & t.isCompleted.equals(false),
      );
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    return query.get();
  }

  Future<List<Reminder>> getCompletedReminders({String? accountId}) {
    final query = select(reminders)..where((t) => t.isCompleted.equals(true));
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    query.orderBy([(t) => OrderingTerm.desc(t.gcDate)]);
    return query.get();
  }

  Future<List<Reminder>> getAllReminders({String? accountId}) {
    final query = select(reminders)
      ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    return query.get();
  }

  Future<void> toggleCompleted(String id, bool isCompleted) async {
    await (update(reminders)..where((t) => t.id.equals(id))).write(
      RemindersCompanion(isCompleted: Value(isCompleted)),
    );
  }

  Stream<List<Reminder>> watchAllReminders({String? accountId}) {
    final query = select(reminders)
      ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    return query.watch();
  }

  Stream<List<Reminder>> watchUpcomingReminders({String? accountId}) {
    final now = DateTime.now();
    final query = select(reminders)
      ..where(
        (t) => t.gcDate.isBiggerOrEqualValue(now) & t.isCompleted.equals(false),
      );
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    return query.watch();
  }

  /// Get all reminders that have a recurrence rule (for expansion).
  Future<List<Reminder>> getRecurringReminders({String? accountId}) {
    final query = select(reminders)..where((t) => t.recurrenceRule.isNotNull());
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    return query.get();
  }
}
