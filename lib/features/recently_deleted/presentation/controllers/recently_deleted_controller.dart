import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/recently_deleted_repository.dart';
import '../providers/recently_deleted_providers.dart';
import '../providers/recently_deleted_view_state.dart';

class RecentlyDeletedController extends Notifier<RecentlyDeletedViewState> {
  @override
  RecentlyDeletedViewState build() {
    return const RecentlyDeletedViewState();
  }

  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final repository = ref.read(recentlyDeletedRepositoryProvider);
      final items = await repository.getAllRecentlyDeleted();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> restoreItem(DeletedItem item) async {
    try {
      final repository = ref.read(recentlyDeletedRepositoryProvider);
      await repository.restoreItem(item);
      await loadItems();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> permanentlyDelete(String id) async {
    try {
      final repository = ref.read(recentlyDeletedRepositoryProvider);
      await repository.permanentlyDelete(id);
      await loadItems();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
