import '../entities/calendar_event.dart';
import '../repositories/calendar_repository.dart';

class GetCalendarEvents {
  final CalendarRepository _repository;

  GetCalendarEvents(this._repository);

  Future<List<CalendarEvent>> call(DateTime month) async {
    return _repository.getEvents(month);
  }
}

class GetCalendarEventsByDate {
  final CalendarRepository _repository;

  GetCalendarEventsByDate(this._repository);

  Future<List<CalendarEvent>> call(DateTime date) async {
    return _repository.getEventsByDate(date);
  }
}

class CreateCalendarEvent {
  final CalendarRepository _repository;

  CreateCalendarEvent(this._repository);

  Future<void> call(CalendarEvent event) async {
    await _repository.createEvent(event);
  }
}

class UpdateCalendarEvent {
  final CalendarRepository _repository;

  UpdateCalendarEvent(this._repository);

  Future<void> call(CalendarEvent event) async {
    await _repository.updateEvent(event);
  }
}

class DeleteCalendarEvent {
  final CalendarRepository _repository;

  DeleteCalendarEvent(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteEvent(id);
  }
}
