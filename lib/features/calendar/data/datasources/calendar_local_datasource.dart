import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../models/calendar_event_model.dart';

class CalendarLocalDatasource {
  final AppDatabase _database;

  CalendarLocalDatasource(this._database);

  Future<List<CalendarEventModel>> getEventsByDateRange(
      DateTime start, DateTime end) async {
    final events = await _database.calendarEventsDao
        .getEventsByDateRange(start, end);
    return events.map(_toModel).toList();
  }

  Future<List<CalendarEventModel>> getEventsByDate(DateTime date) async {
    final events = await _database.calendarEventsDao.getEventsByDate(date);
    return events.map(_toModel).toList();
  }

  Future<CalendarEventModel?> getEventById(String id) async {
    final event = await _database.calendarEventsDao.getEventById(id);
    return event != null ? _toModel(event) : null;
  }

  Future<void> insertEvent(CalendarEventModel event) async {
    await _database.calendarEventsDao
        .insertEvent(_toCompanion(event));
  }

  Future<void> updateEvent(CalendarEventModel event) async {
    await _database.calendarEventsDao
        .updateEvent(_toCompanion(event));
  }

  Future<void> deleteEvent(String id) async {
    await _database.calendarEventsDao.deleteEvent(id);
  }

  Stream<List<CalendarEventModel>> watchEventsByDateRange(
      DateTime start, DateTime end) {
    return _database.calendarEventsDao
        .watchEventsByDateRange(start, end)
        .map((events) => events.map(_toModel).toList());
  }

  CalendarEventModel _toModel(CalendarEvent event) {
    return CalendarEventModel(
      id: event.id,
      title: event.title,
      ecDate: event.ecDate,
      gcDate: event.gcDate,
      description: event.description,
      isAllDay: event.isAllDay,
      category: event.category,
      location: event.location,
      recurrenceRule: event.recurrenceRule,
    );
  }

  CalendarEventsCompanion _toCompanion(CalendarEventModel event) {
    return CalendarEventsCompanion(
      id: Value(event.id),
      title: Value(event.title),
      ecDate: Value(event.ecDate),
      gcDate: Value(event.gcDate),
      description: Value(event.description),
      isAllDay: Value(event.isAllDay),
      category: Value(event.category),
      location: Value(event.location),
      recurrenceRule: Value(event.recurrenceRule),
    );
  }
}
