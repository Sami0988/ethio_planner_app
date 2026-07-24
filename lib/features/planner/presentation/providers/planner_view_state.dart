import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/planner_item.dart';

part 'planner_view_state.freezed.dart';

enum PlannerViewMode { day, week }

@freezed
abstract class PlannerViewState with _$PlannerViewState {
  const factory PlannerViewState({
    required DateTime selectedDate,
    @Default(PlannerViewMode.day) PlannerViewMode viewMode,
    @Default([]) List<PlannerItem> items,
    @Default(false) bool isLoading,
    String? error,
  }) = _PlannerViewState;
}
