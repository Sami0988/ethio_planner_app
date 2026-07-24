import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';
import 'daos/calendar_events_dao.dart';
import 'daos/reminders_dao.dart';
import 'daos/planner_items_dao.dart';
import 'daos/notes_dao.dart';
import 'daos/recently_deleted_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CalendarEvents,
    PlannerItems,
    Reminders,
    Notes,
    RecentlyDeletedItems,
    PrintJobs,
  ],
  daos: [
    CalendarEventsDao,
    RemindersDao,
    PlannerItemsDao,
    NotesDao,
    RecentlyDeletedDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.addColumn(calendarEvents, calendarEvents.isAllDay);
          await m.addColumn(calendarEvents, calendarEvents.category);
          await m.addColumn(calendarEvents, calendarEvents.location);
          await m.addColumn(calendarEvents, calendarEvents.recurrenceRule);
        }
        if (from < 3) {
          await m.createTable(notes);
        }
        if (from < 4) {
          await m.addColumn(calendarEvents, calendarEvents.deletedAt);
          await m.addColumn(plannerItems, plannerItems.deletedAt);
          await m.addColumn(reminders, reminders.deletedAt);
          await m.addColumn(notes, notes.deletedAt);
          await m.createTable(recentlyDeletedItems);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ethio_planner.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
