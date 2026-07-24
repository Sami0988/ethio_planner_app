import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'calendar_events_dao.g.dart';

@DriftAccessor(tables: [CalendarEvents])
class CalendarEventsDao extends DatabaseAccessor<AppDatabase>
    with _$CalendarEventsDaoMixin {
  CalendarEventsDao(super.db);

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
    return (select(
      calendarEvents,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<CalendarEvent>> getEventsByDateRange(
    DateTime start,
    DateTime end, {
    String? accountId,
  }) {
    final query = select(calendarEvents)
      ..where((t) => t.gcDate.isBetweenValues(start, end));
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    return query.get();
  }

  Future<List<CalendarEvent>> getEventsByDate(
    DateTime date, {
    String? accountId,
  }) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return getEventsByDateRange(start, end, accountId: accountId);
  }

  Future<List<CalendarEvent>> getAllEvents({String? accountId}) {
    final query = select(calendarEvents)
      ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    return query.get();
  }

  Stream<List<CalendarEvent>> watchEventsByDateRange(
    DateTime start,
    DateTime end, {
    String? accountId,
  }) {
    final query = select(calendarEvents)
      ..where((t) => t.gcDate.isBetweenValues(start, end));
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    query.orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    return query.watch();
  }

  Stream<List<CalendarEvent>> watchAllEvents({String? accountId}) {
    final query = select(calendarEvents)
      ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]);
    if (accountId != null) {
      query.where((t) => t.accountId.equals(accountId));
    }
    return query.watch();
  }
}
