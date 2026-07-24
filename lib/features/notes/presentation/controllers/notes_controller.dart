import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/get_notes.dart';
import '../providers/notes_view_state.dart';

const _uuid = Uuid();

class NotesController extends Notifier<NotesViewState> {
  late final GetAllNotes _getAllNotes;
  late final SearchNotes _searchNotes;
  late final CreateNote _createNote;
  late final UpdateNote _updateNote;
  late final DeleteNote _deleteNote;
  late final ToggleNotePinned _togglePinned;
  late final ToggleNoteArchived _toggleArchived;

  @override
  NotesViewState build() {
    return const NotesViewState();
  }

  void setDependencies({
    required GetAllNotes getAllNotes,
    required SearchNotes searchNotes,
    required CreateNote createNote,
    required UpdateNote updateNote,
    required DeleteNote deleteNote,
    required ToggleNotePinned togglePinned,
    required ToggleNoteArchived toggleArchived,
  }) {
    _getAllNotes = getAllNotes;
    _searchNotes = searchNotes;
    _createNote = createNote;
    _updateNote = updateNote;
    _deleteNote = deleteNote;
    _togglePinned = togglePinned;
    _toggleArchived = toggleArchived;
  }

  Future<void> loadNotes() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final notes = await _getAllNotes();
      state = state.copyWith(allNotes: notes, isLoading: false);
      _applyFilter();
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void setFilter(NotesFilter filter) {
    state = state.copyWith(filter: filter);
    _applyFilter();
  }

  void _applyFilter() {
    List<Note> filtered;
    switch (state.filter) {
      case NotesFilter.all:
        filtered = state.allNotes;
      case NotesFilter.pinned:
        filtered = state.allNotes.where((n) => n.isPinned).toList();
      case NotesFilter.archived:
        filtered = state.allNotes.where((n) => n.isArchived).toList();
    }
    state = state.copyWith(filteredNotes: filtered);
  }

  Future<void> createNote({
    required String title,
    String? content,
    String? category,
  }) async {
    final now = clock.now();
    final note = Note(
      id: _uuid.v4(),
      title: title,
      content: content,
      createdAt: now,
      updatedAt: now,
      category: category,
    );
    await _createNote(note);
    await loadNotes();
  }

  Future<void> updateNote(Note note) async {
    await _updateNote(note);
    await loadNotes();
  }

  Future<void> deleteNote(String id) async {
    await _deleteNote(id);
    await loadNotes();
  }

  Future<void> togglePinned(String id) async {
    await _togglePinned(id);
    await loadNotes();
  }

  Future<void> toggleArchived(String id) async {
    await _toggleArchived(id);
    await loadNotes();
  }
}
