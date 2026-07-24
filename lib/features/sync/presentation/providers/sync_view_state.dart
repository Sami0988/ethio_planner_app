import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/sync_repository.dart';

part 'sync_view_state.freezed.dart';

@freezed
abstract class SyncViewState with _$SyncViewState {
  const factory SyncViewState({
    @Default(SyncStatus.idle) SyncStatus status,
    @Default(0) int itemsSynced,
    @Default(0) int itemsPending,
    String? error,
    GuestImportResult? lastImportResult,
  }) = _SyncViewState;
}
