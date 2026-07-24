import '../../domain/entities/calendar_event.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../datasources/calendar_local_datasource.dart';
import '../models/calendar_event_model.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarLocalDatasource localDatasource;

  CalendarRepositoryImpl({
    required this.localDatasource,
  });

  @override
  Future<List<CalendarEvent>> getEvents(DateTime month) async {
    final start = DateTime(month.year, month.month, 1);
    final end = DateTime(month.year, month.month + 1, 0, 23, 59, 59);
    final models = await localDatasource.getEventsByDateRange(start, end);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<CalendarEvent>> getEventsByDate(DateTime date) async {
    final models = await localDatasource.getEventsByDate(date);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<CalendarEvent?> getEventById(String id) async {
    final model = await localDatasource.getEventById(id);
    return model?.toEntity();
  }

  @override
  Future<void> createEvent(CalendarEvent event) async {
    final model = CalendarEventModel(
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
    await localDatasource.insertEvent(model);
  }

  @override
  Future<void> updateEvent(CalendarEvent event) async {
    final model = CalendarEventModel(
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
    await localDatasource.updateEvent(model);
  }

  @override
  Future<void> deleteEvent(String id) async {
    await localDatasource.deleteEvent(id);
  }

  @override
  Stream<List<CalendarEvent>> watchEventsByDateRange(
      DateTime start, DateTime end) {
    return localDatasource
        .watchEventsByDateRange(start, end)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }
}
