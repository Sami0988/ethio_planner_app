import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_local_datasource.dart';
import '../models/note_model.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDatasource localDatasource;

  NoteRepositoryImpl({
    required this.localDatasource,
  });

  @override
  Future<List<Note>> getAllNotes() async {
    final models = await localDatasource.getAllNotes();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Note>> getPinnedNotes() async {
    final models = await localDatasource.getPinnedNotes();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Note>> getArchivedNotes() async {
    final models = await localDatasource.getArchivedNotes();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Note>> searchNotes(String query) async {
    final models = await localDatasource.searchNotes(query);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Note?> getNoteById(String id) async {
    final model = await localDatasource.getNoteById(id);
    return model?.toEntity();
  }

  @override
  Future<void> createNote(Note note) async {
    final model = NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
      updatedAt: note.updatedAt,
      isPinned: note.isPinned,
      isArchived: note.isArchived,
      category: note.category,
      linkedEventId: note.linkedEventId,
      linkedReminderId: note.linkedReminderId,
      linkedPlannerItemId: note.linkedPlannerItemId,
    );
    await localDatasource.insertNote(model);
  }

  @override
  Future<void> updateNote(Note note) async {
    final model = NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
      updatedAt: DateTime.now(),
      isPinned: note.isPinned,
      isArchived: note.isArchived,
      category: note.category,
      linkedEventId: note.linkedEventId,
      linkedReminderId: note.linkedReminderId,
      linkedPlannerItemId: note.linkedPlannerItemId,
    );
    await localDatasource.updateNote(model);
  }

  @override
  Future<void> deleteNote(String id) async {
    await localDatasource.deleteNote(id);
  }

  @override
  Future<void> togglePinned(String id) async {
    final note = await localDatasource.getNoteById(id);
    if (note != null) {
      await localDatasource.togglePinned(id, !note.isPinned);
    }
  }

  @override
  Future<void> toggleArchived(String id) async {
    final note = await localDatasource.getNoteById(id);
    if (note != null) {
      await localDatasource.toggleArchived(id, !note.isArchived);
    }
  }

  @override
  Stream<List<Note>> watchAllNotes() {
    return localDatasource
        .watchAllNotes()
        .map((models) => models.map((m) => m.toEntity()).toList());
  }
}
