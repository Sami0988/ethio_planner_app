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

  void setFilterType(DeletedEntityType? type) {
    state = state.copyWith(filterType: type);
  }

  List<DeletedItem> get filteredItems {
    final filter = state.filterType;
    if (filter == null) {
      return state.items;
    }
    return state.items.where((item) => item.entityType == filter).toList();
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
