import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/recently_deleted_repository.dart';

part 'recently_deleted_view_state.freezed.dart';

@freezed
abstract class RecentlyDeletedViewState with _$RecentlyDeletedViewState {
  const factory RecentlyDeletedViewState({
    @Default([]) List<DeletedItem> items,
    @Default(false) bool isLoading,
    String? error,
    DeletedEntityType? filterType,
  }) = _RecentlyDeletedViewState;
}
