import '../entities/calendar_event.dart';

abstract class CalendarRepository {
  Future<List<CalendarEvent>> getEvents(DateTime month);
  Future<List<CalendarEvent>> getEventsByDate(DateTime date);
  Future<CalendarEvent?> getEventById(String id);
  Future<void> createEvent(CalendarEvent event);
  Future<void> updateEvent(CalendarEvent event);
  Future<void> deleteEvent(String id);
  Stream<List<CalendarEvent>> watchEventsByDateRange(
    DateTime start,
    DateTime end,
  );
}
