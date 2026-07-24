import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
abstract class Note with _$Note {
  const factory Note({
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
  }) = _Note;
}
