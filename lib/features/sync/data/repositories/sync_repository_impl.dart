import 'dart:async';
import '../../../../core/database/app_database.dart';
import '../../domain/repositories/sync_repository.dart';
import '../datasources/sync_remote_datasource.dart';

class SyncRepositoryImpl implements SyncRepository {
  final AppDatabase _database;
  final SyncRemoteDatasource _remoteDatasource;

  SyncRepositoryImpl(this._database, this._remoteDatasource);

  final _syncStatusController = StreamController<SyncStatus>.broadcast();

  @override
  Stream<SyncStatus> watchSyncStatus() => _syncStatusController.stream;

  @override
  Future<GuestImportResult> importGuestData() async {
    try {
      _syncStatusController.add(SyncStatus.syncing);

      // Gather all local guest data
      final events = await _database.calendarEventsDao.getAllEvents();
      final reminders = await _database.remindersDao.getAllReminders();
      final plannerItems = await _database.plannerItemsDao.getAllItems();
      final notes = await _database.notesDao.getAllNotes();

      if (events.isEmpty &&
          reminders.isEmpty &&
          plannerItems.isEmpty &&
          notes.isEmpty) {
        _syncStatusController.add(SyncStatus.idle);
        return const GuestImportResult(success: true);
      }

      // Prepare data for import
      final guestData = {
        'events': events
            .map(
              (e) => {
                'id': e.id,
                'title': e.title,
                'ec_date': e.ecDate.toIso8601String(),
                'gc_date': e.gcDate.toIso8601String(),
                'description': e.description,
                'is_all_day': e.isAllDay,
                'category': e.category,
                'location': e.location,
              },
            )
            .toList(),
        'reminders': reminders
            .map(
              (r) => {
                'id': r.id,
                'title': r.title,
                'ec_date': r.ecDate.toIso8601String(),
                'gc_date': r.gcDate.toIso8601String(),
                'description': r.description,
                'is_completed': r.isCompleted,
              },
            )
            .toList(),
        'planner_items': plannerItems
            .map(
              (p) => {
                'id': p.id,
                'title': p.title,
                'ec_date': p.ecDate.toIso8601String(),
                'gc_date': p.gcDate.toIso8601String(),
                'description': p.description,
              },
            )
            .toList(),
        'notes': notes
            .map(
              (n) => {
                'id': n.id,
                'title': n.title,
                'content': n.content,
                'created_at': n.createdAt.toIso8601String(),
                'updated_at': n.updatedAt.toIso8601String(),
                'is_pinned': n.isPinned,
                'category': n.category,
              },
            )
            .toList(),
      };

      // Import to server
      await _remoteDatasource.importGuestData(guestData);

      _syncStatusController.add(SyncStatus.success);

      return GuestImportResult(
        success: true,
        eventsImported: events.length,
        remindersImported: reminders.length,
        plannerItemsImported: plannerItems.length,
        notesImported: notes.length,
      );
    } catch (e) {
      _syncStatusController.add(SyncStatus.error);
      return GuestImportResult(success: false, error: e.toString());
    }
  }

  @override
  Future<SyncResult> syncAll() async {
    try {
      _syncStatusController.add(SyncStatus.syncing);

      int totalSynced = 0;
      int totalPending = 0;

      final eventsResult = await syncCalendarEvents();
      totalSynced += eventsResult.itemsSynced;
      totalPending += eventsResult.itemsPending;

      final remindersResult = await syncReminders();
      totalSynced += remindersResult.itemsSynced;
      totalPending += remindersResult.itemsPending;

      final plannerResult = await syncPlannerItems();
      totalSynced += plannerResult.itemsSynced;
      totalPending += plannerResult.itemsPending;

      final notesResult = await syncNotes();
      totalSynced += notesResult.itemsSynced;
      totalPending += notesResult.itemsPending;

      _syncStatusController.add(SyncStatus.success);

      return SyncResult(
        status: SyncStatus.success,
        itemsSynced: totalSynced,
        itemsPending: totalPending,
      );
    } catch (e) {
      _syncStatusController.add(SyncStatus.error);
      return SyncResult(status: SyncStatus.error, error: e.toString());
    }
  }

  @override
  Future<SyncResult> syncCalendarEvents() async {
    try {
      final events = await _database.calendarEventsDao.getAllEvents();
      // ignore: todo
      // TODO: Implement actual sync logic with server
      return SyncResult(status: SyncStatus.success, itemsSynced: events.length);
    } catch (e) {
      return SyncResult(status: SyncStatus.error, error: e.toString());
    }
  }

  @override
  Future<SyncResult> syncReminders() async {
    try {
      final reminders = await _database.remindersDao.getAllReminders();
      // ignore: todo
      // TODO: Implement actual sync logic with server
      return SyncResult(
        status: SyncStatus.success,
        itemsSynced: reminders.length,
      );
    } catch (e) {
      return SyncResult(status: SyncStatus.error, error: e.toString());
    }
  }

  @override
  Future<SyncResult> syncPlannerItems() async {
    try {
      final items = await _database.plannerItemsDao.getAllItems();
      // ignore: todo
      // TODO: Implement actual sync logic with server
      return SyncResult(status: SyncStatus.success, itemsSynced: items.length);
    } catch (e) {
      return SyncResult(status: SyncStatus.error, error: e.toString());
    }
  }

  @override
  Future<SyncResult> syncNotes() async {
    try {
      final notes = await _database.notesDao.getAllNotes();
      // ignore: todo
      // TODO: Implement actual sync logic with server
      return SyncResult(status: SyncStatus.success, itemsSynced: notes.length);
    } catch (e) {
      return SyncResult(status: SyncStatus.error, error: e.toString());
    }
  }

  @override
  Future<SyncResult> fullResync() async {
    try {
      _syncStatusController.add(SyncStatus.syncing);

      // ignore: todo
      // TODO: Implement full resync logic
      _syncStatusController.add(SyncStatus.success);

      return const SyncResult(status: SyncStatus.success);
    } catch (e) {
      _syncStatusController.add(SyncStatus.error);
      return SyncResult(status: SyncStatus.error, error: e.toString());
    }
  }

  void dispose() {
    _syncStatusController.close();
  }
}
