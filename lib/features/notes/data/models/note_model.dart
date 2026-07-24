import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/note.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
abstract class NoteModel with _$NoteModel {
  const factory NoteModel({
    required String id,
    required String title,
    String? content,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isPinned,
    @Default(false) bool isArchived,
    String? category,
    String? linkedEventId,
    String? linkedReminderId,
    String? linkedPlannerItemId,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}

extension NoteModelX on NoteModel {
  Note toEntity() {
    return Note(
      id: id,
      title: title,
      content: content,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isPinned: isPinned,
      isArchived: isArchived,
      category: category,
      linkedEventId: linkedEventId,
      linkedReminderId: linkedReminderId,
      linkedPlannerItemId: linkedPlannerItemId,
    );
  }
}
