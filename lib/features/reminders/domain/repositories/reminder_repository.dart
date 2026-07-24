import '../entities/reminder.dart';

abstract class ReminderRepository {
  Future<List<Reminder>> getAllReminders();
  Future<List<Reminder>> getRemindersByDate(DateTime date);
  Future<List<Reminder>> getOverdueReminders();
  Future<List<Reminder>> getUpcomingReminders();
  Future<List<Reminder>> getCompletedReminders();
  Future<Reminder?> getReminderById(String id);
  Future<void> createReminder(Reminder reminder);
  Future<void> updateReminder(Reminder reminder);
  Future<void> deleteReminder(String id);
  Future<void> toggleCompleted(String id, bool isCompleted);
  Stream<List<Reminder>> watchAllReminders();
  Stream<List<Reminder>> watchUpcomingReminders();
}
