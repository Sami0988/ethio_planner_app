import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'calendar_events_dao.g.dart';

@DriftAccessor(tables: [CalendarEvents])
class CalendarEventsDao extends DatabaseAccessor<AppDatabase>
    with _$CalendarEventsDaoMixin {
  CalendarEventsDao(AppDatabase db) : super(db);

  Future<int> insertEvent(CalendarEventsCompanion event) {
    return into(calendarEvents).insert(event, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateEvent(CalendarEventsCompanion event) {
    return update(calendarEvents).replace(event);
  }

  Future<int> deleteEvent(String id) {
    return (delete(calendarEvents)..where((t) => t.id.equals(id))).go();
  }

  Future<CalendarEvent?> getEventById(String id) {
    return (select(calendarEvents)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<CalendarEvent>> getEventsByDateRange(DateTime start, DateTime end) {
    return (select(calendarEvents)
          ..where((t) => t.gcDate.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Future<List<CalendarEvent>> getEventsByDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return getEventsByDateRange(start, end);
  }

  Future<List<CalendarEvent>> getAllEvents() {
    return (select(calendarEvents)
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Stream<List<CalendarEvent>> watchEventsByDateRange(DateTime start, DateTime end) {
    return (select(calendarEvents)
          ..where((t) => t.gcDate.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .watch();
  }

  Stream<List<CalendarEvent>> watchAllEvents() {
    return (select(calendarEvents)
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .watch();
  }
}
