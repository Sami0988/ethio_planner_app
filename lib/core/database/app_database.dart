import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'daos/calendar_events_dao.dart';
import 'daos/note_revisions_dao.dart';
import 'daos/notes_dao.dart';
import 'daos/outbox_dao.dart';
import 'daos/planner_items_dao.dart';
import 'daos/recently_deleted_dao.dart';
import 'daos/recurrence_exceptions_dao.dart';
import 'daos/reminders_dao.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CalendarEvents,
    PlannerItems,
    Reminders,
    Notes,
    RecentlyDeletedItems,
    OutboxOperations,
    NoteRevisions,
    RecurrenceExceptions,
  ],
  daos: [
    CalendarEventsDao,
    RemindersDao,
    PlannerItemsDao,
    NotesDao,
    RecentlyDeletedDao,
    OutboxDao,
    NoteRevisionsDao,
    RecurrenceExceptionsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 8;

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
        if (from < 5) {
          // Print Studio is deferred (Phase 1D); drop its out-of-scope table.
          await m.deleteTable('print_jobs');
        }
        if (from < 6) {
          // Sprint 1 foundation: add sync-metadata + accountId to all
          // business tables for account isolation and offline-first sync.
          await m.addColumn(calendarEvents, calendarEvents.accountId);
          await m.addColumn(calendarEvents, calendarEvents.serverVersion);
          await m.addColumn(calendarEvents, calendarEvents.syncStatus);
          await m.addColumn(calendarEvents, calendarEvents.lastOperationId);
          await m.addColumn(plannerItems, plannerItems.accountId);
          await m.addColumn(plannerItems, plannerItems.serverVersion);
          await m.addColumn(plannerItems, plannerItems.syncStatus);
          await m.addColumn(plannerItems, plannerItems.lastOperationId);
          await m.addColumn(reminders, reminders.accountId);
          await m.addColumn(reminders, reminders.serverVersion);
          await m.addColumn(reminders, reminders.syncStatus);
          await m.addColumn(reminders, reminders.lastOperationId);
          await m.addColumn(notes, notes.accountId);
          await m.addColumn(notes, notes.serverVersion);
          await m.addColumn(notes, notes.syncStatus);
          await m.addColumn(notes, notes.lastOperationId);
          await m.createTable(outboxOperations);
        }
        if (from < 7) {
          await m.createTable(noteRevisions);
        }
        if (from < 8) {
          await m.createTable(recurrenceExceptions);
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          // Fresh database — all columns created via onCreate.
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
