import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../models/reminder_model.dart';

class ReminderLocalDatasource {
  final AppDatabase _database;

  ReminderLocalDatasource(this._database);

  Future<List<ReminderModel>> getAllReminders() async {
    final reminders = await _database.remindersDao.getAllReminders();
    return reminders.map(_toModel).toList();
  }

  Future<List<ReminderModel>> getRemindersByDate(DateTime date) async {
    final reminders = await _database.remindersDao.getRemindersByDate(date);
    return reminders.map(_toModel).toList();
  }

  Future<List<ReminderModel>> getOverdueReminders() async {
    final reminders = await _database.remindersDao.getOverdueReminders();
    return reminders.map(_toModel).toList();
  }

  Future<List<ReminderModel>> getUpcomingReminders() async {
    final reminders = await _database.remindersDao.getUpcomingReminders();
    return reminders.map(_toModel).toList();
  }

  Future<List<ReminderModel>> getCompletedReminders() async {
    final reminders = await _database.remindersDao.getCompletedReminders();
    return reminders.map(_toModel).toList();
  }

  Future<ReminderModel?> getReminderById(String id) async {
    final reminder = await _database.remindersDao.getReminderById(id);
    return reminder != null ? _toModel(reminder) : null;
  }

  Future<void> insertReminder(ReminderModel reminder) async {
    await _database.remindersDao.insertReminder(_toCompanion(reminder));
  }

  Future<void> updateReminder(ReminderModel reminder) async {
    await _database.remindersDao.updateReminder(_toCompanion(reminder));
  }

  Future<void> deleteReminder(String id) async {
    await _database.remindersDao.deleteReminder(id);
  }

  Future<void> toggleCompleted(String id, bool isCompleted) async {
    await _database.remindersDao.toggleCompleted(id, isCompleted);
  }

  Stream<List<ReminderModel>> watchAllReminders() {
    return _database.remindersDao
        .watchAllReminders()
        .map((reminders) => reminders.map(_toModel).toList());
  }

  Stream<List<ReminderModel>> watchUpcomingReminders() {
    return _database.remindersDao
        .watchUpcomingReminders()
        .map((reminders) => reminders.map(_toModel).toList());
  }

  ReminderModel _toModel(Reminder reminder) {
    return ReminderModel(
      id: reminder.id,
      title: reminder.title,
      ecDate: reminder.ecDate,
      gcDate: reminder.gcDate,
      description: reminder.description,
      isCompleted: reminder.isCompleted,
      notificationId: reminder.notificationId,
      category: reminder.category,
      linkedEventId: reminder.linkedEventId,
      recurrenceRule: reminder.recurrenceRule,
    );
  }

  RemindersCompanion _toCompanion(ReminderModel reminder) {
    return RemindersCompanion(
      id: Value(reminder.id),
      title: Value(reminder.title),
      ecDate: Value(reminder.ecDate),
      gcDate: Value(reminder.gcDate),
      description: Value(reminder.description),
      isCompleted: Value(reminder.isCompleted),
      notificationId: Value(reminder.notificationId),
    );
  }
}
