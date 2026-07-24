import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/conflict_repository.dart';

part 'conflict_view_state.freezed.dart';

@freezed
abstract class ConflictViewState with _$ConflictViewState {
  const factory ConflictViewState({
    @Default([]) List<SyncConflictItem> conflicts,
    @Default(false) bool isLoading,
    String? error,
  }) = _ConflictViewState;
}
