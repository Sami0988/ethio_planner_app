import '../../domain/repositories/conflict_repository.dart';

class ConflictRepositoryImpl implements ConflictRepository {
  // In-memory store for conflicts (will be populated from sync)
  final List<SyncConflictItem> _conflicts = [];

  @override
  Future<List<SyncConflictItem>> getConflicts() async {
    return List.unmodifiable(_conflicts);
  }

  @override
  Future<void> resolveConflict(
    String conflictId,
    ConflictResolution resolution,
  ) async {
    final index = _conflicts.indexWhere((c) => c.id == conflictId);
    if (index != -1) {
      // TODO: Apply the resolution (merge data, keep local/remote, etc.)
      _conflicts.removeAt(index);
    }
  }

  @override
  Future<void> resolveAllConflicts(ConflictResolution resolution) async {
    // TODO: Apply the resolution to all conflicts
    _conflicts.clear();
  }

  void addConflict(SyncConflictItem conflict) {
    _conflicts.add(conflict);
  }
}
