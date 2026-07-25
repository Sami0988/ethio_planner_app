import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/search_repository.dart';

part 'search_view_state.freezed.dart';

@freezed
abstract class SearchViewState with _$SearchViewState {
  const factory SearchViewState({
    @Default('') String query,
    @Default([]) List<SearchResult> results,
    @Default(false) bool isLoading,
    String? error,
    @Default(SearchFilters()) SearchFilters filters,
  }) = _SearchViewState;
}
