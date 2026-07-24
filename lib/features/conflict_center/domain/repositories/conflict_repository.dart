enum ConflictEntityType { event, reminder, plannerItem, note }

enum ConflictResolution { keepLocal, keepRemote, keepBoth, manual }

class SyncConflictItem {
  final String id;
  final ConflictEntityType entityType;
  final String entityId;
  final String localVersion;
  final String remoteVersion;
  final String localTitle;
  final String remoteTitle;
  final DateTime lastModifiedLocal;
  final DateTime lastModifiedRemote;
  final Map<String, dynamic>? localData;
  final Map<String, dynamic>? remoteData;

  const SyncConflictItem({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.localVersion,
    required this.remoteVersion,
    required this.localTitle,
    required this.remoteTitle,
    required this.lastModifiedLocal,
    required this.lastModifiedRemote,
    this.localData,
    this.remoteData,
  });
}

abstract class ConflictRepository {
  Future<List<SyncConflictItem>> getConflicts();
  Future<void> resolveConflict(
    String conflictId,
    ConflictResolution resolution,
  );
  Future<void> resolveAllConflicts(ConflictResolution resolution);
}
