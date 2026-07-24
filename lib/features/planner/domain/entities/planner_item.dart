import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_item.freezed.dart';

enum PlannerSection { focus, priorities, checklist, notes, reflection }

@freezed
abstract class PlannerItem with _$PlannerItem {
  const factory PlannerItem({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    String? description,
    @Default(false) bool isCompleted,
    @Default(PlannerSection.focus) PlannerSection section,
    @Default(0) int sortOrder,
    String? linkedEventId,
    String? linkedReminderId,
  }) = _PlannerItem;
}
