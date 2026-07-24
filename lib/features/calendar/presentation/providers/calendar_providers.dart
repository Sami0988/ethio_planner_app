import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/database_provider.dart';
import '../../data/datasources/calendar_local_datasource.dart';
import '../../data/repositories/calendar_repository_impl.dart';
import '../../domain/usecases/get_calendar_events.dart';
import '../controllers/calendar_controller.dart';
import 'calendar_view_state.dart';

final calendarLocalDatasourceProvider = Provider<CalendarLocalDatasource>(
  (ref) => CalendarLocalDatasource(ref.watch(databaseProvider)),
);

final calendarRepositoryProvider = Provider<CalendarRepositoryImpl>(
  (ref) => CalendarRepositoryImpl(
    localDatasource: ref.watch(calendarLocalDatasourceProvider),
  ),
);

final getCalendarEventsProvider = Provider<GetCalendarEvents>(
  (ref) => GetCalendarEvents(ref.watch(calendarRepositoryProvider)),
);

final getCalendarEventsByDateProvider = Provider<GetCalendarEventsByDate>(
  (ref) => GetCalendarEventsByDate(ref.watch(calendarRepositoryProvider)),
);

final createCalendarEventProvider = Provider<CreateCalendarEvent>(
  (ref) => CreateCalendarEvent(ref.watch(calendarRepositoryProvider)),
);

final updateCalendarEventProvider = Provider<UpdateCalendarEvent>(
  (ref) => UpdateCalendarEvent(ref.watch(calendarRepositoryProvider)),
);

final deleteCalendarEventProvider = Provider<DeleteCalendarEvent>(
  (ref) => DeleteCalendarEvent(ref.watch(calendarRepositoryProvider)),
);

final calendarControllerProvider =
    NotifierProvider<CalendarController, CalendarViewState>(
  CalendarController.new,
);
