import '../../domain/entities/reminder.dart';
import '../../domain/repositories/reminder_repository.dart';
import '../datasources/reminder_local_datasource.dart';
import '../models/reminder_model.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final ReminderLocalDatasource localDatasource;

  ReminderRepositoryImpl({required this.localDatasource});

  @override
  Future<List<Reminder>> getAllReminders() async {
    final models = await localDatasource.getAllReminders();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Reminder>> getRemindersByDate(DateTime date) async {
    final models = await localDatasource.getRemindersByDate(date);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Reminder>> getOverdueReminders() async {
    final models = await localDatasource.getOverdueReminders();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Reminder>> getUpcomingReminders() async {
    final models = await localDatasource.getUpcomingReminders();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Reminder>> getCompletedReminders() async {
    final models = await localDatasource.getCompletedReminders();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Reminder?> getReminderById(String id) async {
    final model = await localDatasource.getReminderById(id);
    return model?.toEntity();
  }

  @override
  Future<void> createReminder(Reminder reminder) async {
    final model = ReminderModel(
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
    await localDatasource.insertReminder(model);
  }

  @override
  Future<void> updateReminder(Reminder reminder) async {
    final model = ReminderModel(
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
    await localDatasource.updateReminder(model);
  }

  @override
  Future<void> deleteReminder(String id) async {
    await localDatasource.deleteReminder(id);
  }

  @override
  Future<void> toggleCompleted(String id, bool isCompleted) async {
    await localDatasource.toggleCompleted(id, isCompleted);
  }

  @override
  Stream<List<Reminder>> watchAllReminders() {
    return localDatasource.watchAllReminders().map(
      (models) => models.map((m) => m.toEntity()).toList(),
    );
  }

  @override
  Stream<List<Reminder>> watchUpcomingReminders() {
    return localDatasource.watchUpcomingReminders().map(
      (models) => models.map((m) => m.toEntity()).toList(),
    );
  }
}
