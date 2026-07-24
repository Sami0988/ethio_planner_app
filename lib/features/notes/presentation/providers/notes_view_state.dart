import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/note.dart';

part 'notes_view_state.freezed.dart';

enum NotesFilter { all, pinned, archived }

@freezed
abstract class NotesViewState with _$NotesViewState {
  const factory NotesViewState({
    @Default(NotesFilter.all) NotesFilter filter,
    @Default([]) List<Note> allNotes,
    @Default([]) List<Note> filteredNotes,
    @Default(false) bool isLoading,
    String? error,
  }) = _NotesViewState;
}
