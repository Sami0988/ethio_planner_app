import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../core/recently_deleted/soft_delete_provider.dart';
import '../../../../core/recently_deleted/soft_delete_service.dart';
import '../../data/datasources/note_local_datasource.dart';
import '../../data/repositories/note_repository_impl.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/get_notes.dart';
import '../providers/notes_view_state.dart';

const _uuid = Uuid();

class NotesController extends Notifier<NotesViewState> {
  late GetAllNotes _getAllNotes;
  late SearchNotes _searchNotes;
  late CreateNote _createNote;
  late UpdateNote _updateNote;
  late ToggleNotePinned _togglePinned;
  late ToggleNoteArchived _toggleArchived;
  late SoftDeleteService _softDeleteService;

  @override
  NotesViewState build() {
    final db = ref.read(databaseProvider);
    final repo = NoteRepositoryImpl(
      localDatasource: NoteLocalDatasource(db),
    );
    _getAllNotes = GetAllNotes(repo);
    _searchNotes = SearchNotes(repo);
    _createNote = CreateNote(repo);
    _updateNote = UpdateNote(repo);
    _togglePinned = ToggleNotePinned(repo);
    _toggleArchived = ToggleNoteArchived(repo);
    _softDeleteService = ref.read(softDeleteServiceProvider);
    return const NotesViewState();
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
    String? linkedEventId,
    String? linkedReminderId,
    String? linkedPlannerItemId,
  }) async {
    final now = clock.now();
    final note = Note(
      id: _uuid.v4(),
      title: title,
      content: content,
      createdAt: now,
      updatedAt: now,
      category: category,
      linkedEventId: linkedEventId,
      linkedReminderId: linkedReminderId,
      linkedPlannerItemId: linkedPlannerItemId,
    );
    await _createNote(note);
    await loadNotes();
  }

  Future<void> updateNote(Note note) async {
    await _updateNote(note);
    await loadNotes();
  }

  Future<void> deleteNote(String id) async {
    await _softDeleteService.softDeleteNote(id);
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

  Future<void> searchNotes(String query) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final notes = await _searchNotes(query);
      state = state.copyWith(allNotes: notes, isLoading: false);
      _applyFilter();
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
