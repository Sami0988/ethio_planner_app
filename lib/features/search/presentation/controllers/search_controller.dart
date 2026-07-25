import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/search_repository_impl.dart';
import '../../domain/repositories/search_repository.dart';
import '../providers/search_view_state.dart';

class SearchController extends Notifier<SearchViewState> {
  SearchRepositoryImpl? _repository;

  @override
  SearchViewState build() {
    return const SearchViewState();
  }

  void setRepository(SearchRepositoryImpl repository) {
    _repository = repository;
  }

  Future<void> search(String query) async {
    state = state.copyWith(query: query, isLoading: true, error: null);

    if (query.trim().isEmpty) {
      state = state.copyWith(results: [], isLoading: false);
      return;
    }

    if (_repository == null) {
      state = state.copyWith(error: 'Search not initialized', isLoading: false);
      return;
    }

    try {
      final results = await _repository!.search(query, filters: state.filters);
      state = state.copyWith(results: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void setTypeFilter(Set<SearchResultType>? types) {
    state = state.copyWith(filters: state.filters.copyWith(types: types));
    if (state.query.isNotEmpty) {
      search(state.query);
    }
  }

  void setDateRange(SearchDateRange? range) {
    state = state.copyWith(
      filters: state.filters.copyWith(
        dateRange: range,
        clearDateRange: range == null,
      ),
    );
    if (state.query.isNotEmpty) {
      search(state.query);
    }
  }

  void setCategory(String? category) {
    state = state.copyWith(
      filters: state.filters.copyWith(
        category: category,
        clearCategory: category == null,
      ),
    );
    if (state.query.isNotEmpty) {
      search(state.query);
    }
  }

  void clearFilters() {
    state = state.copyWith(filters: const SearchFilters());
    if (state.query.isNotEmpty) {
      search(state.query);
    }
  }

  void clearSearch() {
    state = const SearchViewState();
  }
}
