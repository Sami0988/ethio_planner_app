import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/sync_repository.dart';
import '../providers/sync_providers.dart';
import '../providers/sync_view_state.dart';

class SyncController extends Notifier<SyncViewState> {
  @override
  SyncViewState build() {
    return const SyncViewState();
  }

  Future<void> importGuestData() async {
    state = state.copyWith(status: SyncStatus.syncing, error: null);

    final repository = ref.read(syncRepositoryProvider);
    final result = await repository.importGuestData();

    state = state.copyWith(
      status: result.success ? SyncStatus.success : SyncStatus.error,
      lastImportResult: result,
      error: result.error,
    );
  }

  Future<void> syncAll() async {
    state = state.copyWith(status: SyncStatus.syncing, error: null);

    final repository = ref.read(syncRepositoryProvider);
    final result = await repository.syncAll();

    state = state.copyWith(
      status: result.status,
      itemsSynced: result.itemsSynced,
      itemsPending: result.itemsPending,
      error: result.error,
    );
  }

  Future<void> fullResync() async {
    state = state.copyWith(status: SyncStatus.syncing, error: null);

    final repository = ref.read(syncRepositoryProvider);
    final result = await repository.fullResync();

    state = state.copyWith(
      status: result.status,
      error: result.error,
    );
  }

  void resetStatus() {
    state = state.copyWith(status: SyncStatus.idle, error: null);
  }
}
