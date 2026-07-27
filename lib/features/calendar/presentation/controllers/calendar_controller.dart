import 'package:clock/clock.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart'
    show RecurrenceExceptionsCompanion;
import '../../../../core/providers/database_provider.dart';
import '../../../../core/recently_deleted/soft_delete_service.dart';
import '../../domain/entities/calendar_event.dart';
import '../../domain/usecases/get_calendar_events.dart';
import '../providers/calendar_view_state.dart';

const _uuid = Uuid();

class CalendarController extends Notifier<CalendarViewState> {
  GetCalendarEvents? _getEvents;
  GetCalendarEventsByDate? _getEventsByDate;
  CreateCalendarEvent? _createEvent;
  UpdateCalendarEvent? _updateEvent;
  DeleteCalendarEvent? _deleteEvent;
  SoftDeleteService? _softDeleteService;

  bool get _isReady =>
      _getEvents != null &&
      _getEventsByDate != null &&
      _createEvent != null &&
      _updateEvent != null &&
      _deleteEvent != null;

  @override
  CalendarViewState build() {
    final now = clock.now();
    return CalendarViewState(
      currentMonth: DateTime(now.year, now.month),
      selectedDate: now,
    );
  }

  void setDependencies({
    required GetCalendarEvents getEvents,
    required GetCalendarEventsByDate getEventsByDate,
    required CreateCalendarEvent createEvent,
    required UpdateCalendarEvent updateEvent,
    required DeleteCalendarEvent deleteEvent,
    SoftDeleteService? softDeleteService,
  }) {
    _getEvents = getEvents;
    _getEventsByDate = getEventsByDate;
    _createEvent = createEvent;
    _updateEvent = updateEvent;
    _deleteEvent = deleteEvent;
    _softDeleteService = softDeleteService;
  }

  Future<void> loadEvents() async {
    if (!_isReady) return;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final events = await _getEvents!(state.currentMonth);
      // Pre-compute event dates set for O(1) lookup in hasEventsOnDate
      final eventDates = <String>{};
      for (final event in events) {
        final key = '${event.gcDate.year}-${event.gcDate.month}-${event.gcDate.day}';
        eventDates.add(key);
      }
      state = state.copyWith(
        events: events,
        eventDates: eventDates,
        isLoading: false,
      );
      if (state.selectedDate != null) {
        final dayEvents = await _getEventsByDate!(state.selectedDate!);
        state = state.copyWith(selectedDayEvents: dayEvents);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> selectDate(DateTime date) async {
    if (!_isReady) return;
    state = state.copyWith(selectedDate: date);
    try {
      final events = await _getEventsByDate!(date);
      state = state.copyWith(selectedDayEvents: events);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> goToPreviousMonth() async {
    final newMonth = DateTime(
      state.currentMonth.year,
      state.currentMonth.month - 1,
    );
    state = state.copyWith(currentMonth: newMonth);
    await loadEvents();
  }

  Future<void> goToNextMonth() async {
    final newMonth = DateTime(
      state.currentMonth.year,
      state.currentMonth.month + 1,
    );
    state = state.copyWith(currentMonth: newMonth);
    await loadEvents();
  }

  Future<void> goToMonth(DateTime month) async {
    state = state.copyWith(currentMonth: month);
    await loadEvents();
  }

  Future<void> createEvent({
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    String? description,
    bool isAllDay = false,
    String? category,
    String? location,
    String? recurrenceRule,
  }) async {
    if (!_isReady) return;
    final event = CalendarEvent(
      id: _uuid.v4(),
      title: title,
      ecDate: ecDate,
      gcDate: gcDate,
      description: description,
      isAllDay: isAllDay,
      category: category,
      location: location,
      recurrenceRule: recurrenceRule,
    );
    await _createEvent!(event);
    await loadEvents();
  }

  Future<void> updateEvent(CalendarEvent event) async {
    if (!_isReady) return;
    await _updateEvent!(event);
    await loadEvents();
  }

  Future<void> deleteEvent(String id) async {
    if (!_isReady) return;
    if (_softDeleteService != null) {
      await _softDeleteService!.softDeleteEvent(id);
    } else {
      await _deleteEvent!(id);
    }
    await loadEvents();
  }

  List<CalendarEvent> getEventsForDay(DateTime day) {
    return state.events.where((e) {
      return e.gcDate.year == day.year &&
          e.gcDate.month == day.month &&
          e.gcDate.day == day.day;
    }).toList();
  }

  bool hasEventsOnDate(DateTime day) {
    final key = '${day.year}-${day.month}-${day.day}';
    return state.eventDates.contains(key);
  }

  /// Creates a recurrence exception for a single occurrence modification.
  Future<void> createOccurrenceException({
    required String eventId,
    required DateTime originalGcDate,
    required DateTime modifiedGcDate,
    required DateTime modifiedEcDate,
  }) async {
    final db = ref.read(databaseProvider);
    final exceptionKey = '${eventId}_${originalGcDate.millisecondsSinceEpoch}';
    await db.recurrenceExceptionsDao.upsertException(
      RecurrenceExceptionsCompanion.insert(
        id: const Uuid().v4(),
        entityType: 'event',
        entityId: eventId,
        exceptionKey: exceptionKey,
        exceptionType: 'modified',
        modifiedGcDate: Value(modifiedGcDate),
        modifiedEcDate: Value(modifiedEcDate),
        createdAt: DateTime.now(),
      ),
    );
  }
}
