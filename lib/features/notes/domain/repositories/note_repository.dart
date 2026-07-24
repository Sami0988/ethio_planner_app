import '../entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getAllNotes();
  Future<List<Note>> getPinnedNotes();
  Future<List<Note>> getArchivedNotes();
  Future<List<Note>> searchNotes(String query);
  Future<Note?> getNoteById(String id);
  Future<void> createNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String id);
  Future<void> togglePinned(String id);
  Future<void> toggleArchived(String id);
  Stream<List<Note>> watchAllNotes();
}
