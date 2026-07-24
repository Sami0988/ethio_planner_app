import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/conflict_repository.dart';
import '../providers/conflict_providers.dart';
import '../providers/conflict_view_state.dart';

class ConflictController extends Notifier<ConflictViewState> {
  @override
  ConflictViewState build() {
    return const ConflictViewState();
  }

  Future<void> loadConflicts() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final repository = ref.read(conflictRepositoryProvider);
      final conflicts = await repository.getConflicts();
      state = state.copyWith(conflicts: conflicts, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> resolveConflict(
    String conflictId,
    ConflictResolution resolution,
  ) async {
    try {
      final repository = ref.read(conflictRepositoryProvider);
      await repository.resolveConflict(conflictId, resolution);
      await loadConflicts();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> resolveAllConflicts(ConflictResolution resolution) async {
    try {
      final repository = ref.read(conflictRepositoryProvider);
      await repository.resolveAllConflicts(resolution);
      await loadConflicts();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
