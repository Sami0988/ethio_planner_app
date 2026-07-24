import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/search_repository_impl.dart';
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
      final results = await _repository!.search(query);
      state = state.copyWith(results: results, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void clearSearch() {
    state = const SearchViewState();
  }
}
