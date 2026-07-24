import '../entities/reminder.dart';
import '../repositories/reminder_repository.dart';

class GetReminders {
  final ReminderRepository _repository;

  GetReminders(this._repository);

  Future<List<Reminder>> call() async {
    return _repository.getAllReminders();
  }
}

class GetRemindersByDate {
  final ReminderRepository _repository;

  GetRemindersByDate(this._repository);

  Future<List<Reminder>> call(DateTime date) async {
    return _repository.getRemindersByDate(date);
  }
}

class GetOverdueReminders {
  final ReminderRepository _repository;

  GetOverdueReminders(this._repository);

  Future<List<Reminder>> call() async {
    return _repository.getOverdueReminders();
  }
}

class GetUpcomingReminders {
  final ReminderRepository _repository;

  GetUpcomingReminders(this._repository);

  Future<List<Reminder>> call() async {
    return _repository.getUpcomingReminders();
  }
}

class CreateReminder {
  final ReminderRepository _repository;

  CreateReminder(this._repository);

  Future<void> call(Reminder reminder) async {
    await _repository.createReminder(reminder);
  }
}

class UpdateReminder {
  final ReminderRepository _repository;

  UpdateReminder(this._repository);

  Future<void> call(Reminder reminder) async {
    await _repository.updateReminder(reminder);
  }
}

class DeleteReminder {
  final ReminderRepository _repository;

  DeleteReminder(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteReminder(id);
  }
}

class ToggleReminderCompleted {
  final ReminderRepository _repository;

  ToggleReminderCompleted(this._repository);

  Future<void> call(String id, bool isCompleted) async {
    await _repository.toggleCompleted(id, isCompleted);
  }
}
