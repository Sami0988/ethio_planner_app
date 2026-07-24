import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/planner_item.dart';

part 'planner_item_model.freezed.dart';
part 'planner_item_model.g.dart';

@JsonEnum()
enum PlannerSectionModel {
  focus,
  priorities,
  checklist,
  notes,
  reflection,
}

@freezed
abstract class PlannerItemModel with _$PlannerItemModel {
  const factory PlannerItemModel({
    required String id,
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    String? description,
    @Default(false) bool isCompleted,
    @Default(PlannerSectionModel.focus) PlannerSectionModel section,
    @Default(0) int sortOrder,
    String? linkedEventId,
    String? linkedReminderId,
  }) = _PlannerItemModel;

  factory PlannerItemModel.fromJson(Map<String, dynamic> json) =>
      _$PlannerItemModelFromJson(json);
}

extension PlannerItemModelX on PlannerItemModel {
  PlannerItem toEntity() {
    return PlannerItem(
      id: id,
      title: title,
      ecDate: ecDate,
      gcDate: gcDate,
      description: description,
      isCompleted: isCompleted,
      section: section.toEntity(),
      sortOrder: sortOrder,
      linkedEventId: linkedEventId,
      linkedReminderId: linkedReminderId,
    );
  }
}

extension PlannerSectionModelX on PlannerSectionModel {
  PlannerSection toEntity() {
    switch (this) {
      case PlannerSectionModel.focus:
        return PlannerSection.focus;
      case PlannerSectionModel.priorities:
        return PlannerSection.priorities;
      case PlannerSectionModel.checklist:
        return PlannerSection.checklist;
      case PlannerSectionModel.notes:
        return PlannerSection.notes;
      case PlannerSectionModel.reflection:
        return PlannerSection.reflection;
    }
  }
}

extension PlannerSectionX on PlannerSection {
  PlannerSectionModel toModel() {
    switch (this) {
      case PlannerSection.focus:
        return PlannerSectionModel.focus;
      case PlannerSection.priorities:
        return PlannerSectionModel.priorities;
      case PlannerSection.checklist:
        return PlannerSectionModel.checklist;
      case PlannerSection.notes:
        return PlannerSectionModel.notes;
      case PlannerSection.reflection:
        return PlannerSectionModel.reflection;
    }
  }
}
