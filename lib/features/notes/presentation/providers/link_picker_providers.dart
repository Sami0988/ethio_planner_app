import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/providers/database_provider.dart';

/// All events available for linking to notes.
final allEventsForLinkProvider =
    FutureProvider.autoDispose<List<CalendarEvent>>((ref) async {
      final db = ref.watch(databaseProvider);
      return db.calendarEventsDao.getAllEvents();
    });

/// All reminders available for linking to notes.
final allRemindersForLinkProvider = FutureProvider.autoDispose<List<Reminder>>((
  ref,
) async {
  final db = ref.watch(databaseProvider);
  return db.remindersDao.getAllReminders();
});

/// All planner items available for linking to notes.
final allPlannerItemsForLinkProvider =
    FutureProvider.autoDispose<List<PlannerItem>>((ref) async {
      final db = ref.watch(databaseProvider);
      return db.plannerItemsDao.getAllItems();
    });
