enum SyncStatus {
  idle,
  syncing,
  success,
  error,
  conflictDetected,
  waitingForConnection,
}

class SyncResult {
  final SyncStatus status;
  final int itemsSynced;
  final int itemsPending;
  final String? error;
  final List<SyncConflict>? conflicts;

  const SyncResult({
    required this.status,
    this.itemsSynced = 0,
    this.itemsPending = 0,
    this.error,
    this.conflicts,
  });
}

class SyncConflict {
  final String entityType;
  final String entityId;
  final String localVersion;
  final String remoteVersion;
  final DateTime lastModifiedLocal;
  final DateTime lastModifiedRemote;

  const SyncConflict({
    required this.entityType,
    required this.entityId,
    required this.localVersion,
    required this.remoteVersion,
    required this.lastModifiedLocal,
    required this.lastModifiedRemote,
  });
}

class GuestImportResult {
  final bool success;
  final int eventsImported;
  final int remindersImported;
  final int plannerItemsImported;
  final int notesImported;
  final String? error;

  const GuestImportResult({
    required this.success,
    this.eventsImported = 0,
    this.remindersImported = 0,
    this.plannerItemsImported = 0,
    this.notesImported = 0,
    this.error,
  });
}

abstract class SyncRepository {
  Future<GuestImportResult> importGuestData();
  Future<SyncResult> syncAll();
  Future<SyncResult> syncCalendarEvents();
  Future<SyncResult> syncReminders();
  Future<SyncResult> syncPlannerItems();
  Future<SyncResult> syncNotes();
  Future<SyncResult> fullResync();
  Stream<SyncStatus> watchSyncStatus();
}
