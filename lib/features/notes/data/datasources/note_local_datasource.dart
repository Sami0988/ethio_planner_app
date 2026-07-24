import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../models/note_model.dart';

class NoteLocalDatasource {
  final AppDatabase _database;

  NoteLocalDatasource(this._database);

  Future<List<NoteModel>> getAllNotes() async {
    final notes = await _database.notesDao.getAllNotes();
    return notes.map(_toModel).toList();
  }

  Future<List<NoteModel>> getPinnedNotes() async {
    final notes = await _database.notesDao.getPinnedNotes();
    return notes.map(_toModel).toList();
  }

  Future<List<NoteModel>> getArchivedNotes() async {
    final notes = await _database.notesDao.getArchivedNotes();
    return notes.map(_toModel).toList();
  }

  Future<List<NoteModel>> searchNotes(String query) async {
    final notes = await _database.notesDao.searchNotes(query);
    return notes.map(_toModel).toList();
  }

  Future<NoteModel?> getNoteById(String id) async {
    final note = await _database.notesDao.getNoteById(id);
    return note != null ? _toModel(note) : null;
  }

  Future<void> insertNote(NoteModel note) async {
    await _database.notesDao.insertNote(_toCompanion(note));
  }

  Future<void> updateNote(NoteModel note) async {
    await _database.notesDao.updateNote(_toCompanion(note));
  }

  Future<void> deleteNote(String id) async {
    await _database.notesDao.deleteNote(id);
  }

  Future<void> togglePinned(String id, bool isPinned) async {
    await _database.notesDao.togglePinned(id, isPinned);
  }

  Future<void> toggleArchived(String id, bool isArchived) async {
    await _database.notesDao.toggleArchived(id, isArchived);
  }

  Stream<List<NoteModel>> watchAllNotes() {
    return _database.notesDao.watchAllNotes().map(
      (notes) => notes.map(_toModel).toList(),
    );
  }

  NoteModel _toModel(Note note) {
    return NoteModel(
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
  }

  NotesCompanion _toCompanion(NoteModel note) {
    return NotesCompanion(
      id: Value(note.id),
      title: Value(note.title),
      content: Value(note.content),
      createdAt: Value(note.createdAt),
      updatedAt: Value(note.updatedAt),
      isPinned: Value(note.isPinned),
      isArchived: Value(note.isArchived),
      category: Value(note.category),
      linkedEventId: Value(note.linkedEventId),
      linkedReminderId: Value(note.linkedReminderId),
      linkedPlannerItemId: Value(note.linkedPlannerItemId),
    );
  }
}
