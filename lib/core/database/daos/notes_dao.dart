import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'notes_dao.g.dart';

@DriftAccessor(tables: [Notes])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(AppDatabase db) : super(db);

  Future<int> insertNote(NotesCompanion note) {
    return into(notes).insert(note, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateNote(NotesCompanion note) {
    return update(notes).replace(note);
  }

  Future<int> deleteNote(String id) {
    return (delete(notes)..where((t) => t.id.equals(id))).go();
  }

  Future<Note?> getNoteById(String id) {
    return (select(notes)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<Note>> getAllNotes() {
    return (select(notes)
          ..where((t) => t.isArchived.equals(false))
          ..orderBy([
            (t) => OrderingTerm.desc(t.isPinned),
            (t) => OrderingTerm.desc(t.updatedAt),
          ]))
        .get();
  }

  Future<List<Note>> getPinnedNotes() {
    return (select(notes)
          ..where((t) =>
              t.isPinned.equals(true) & t.isArchived.equals(false))
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
  }

  Future<List<Note>> getArchivedNotes() {
    return (select(notes)
          ..where((t) => t.isArchived.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
  }

  Future<List<Note>> searchNotes(String query) {
    return (select(notes)
          ..where((t) =>
              (t.title.like('%$query%') | t.content.like('%$query%')) &
              t.isArchived.equals(false))
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
  }

  Future<void> togglePinned(String id, bool isPinned) async {
    await (update(notes)..where((t) => t.id.equals(id))).write(
      NotesCompanion(isPinned: Value(isPinned)),
    );
  }

  Future<void> toggleArchived(String id, bool isArchived) async {
    await (update(notes)..where((t) => t.id.equals(id))).write(
      NotesCompanion(isArchived: Value(isArchived)),
    );
  }

  Stream<List<Note>> watchAllNotes() {
    return (select(notes)
          ..where((t) => t.isArchived.equals(false))
          ..orderBy([
            (t) => OrderingTerm.desc(t.isPinned),
            (t) => OrderingTerm.desc(t.updatedAt),
          ]))
        .watch();
  }
}
