import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'note_revisions_dao.g.dart';

@DriftAccessor(tables: [NoteRevisions])
class NoteRevisionsDao extends DatabaseAccessor<AppDatabase>
    with _$NoteRevisionsDaoMixin {
  NoteRevisionsDao(super.db);

  Future<int> insertRevision(NoteRevisionsCompanion revision) {
    return into(noteRevisions).insert(revision, mode: InsertMode.insertOrReplace);
  }

  Future<List<NoteRevision>> getRevisionsForNote(String noteId) {
    final query = select(noteRevisions)
      ..where((t) => t.noteId.equals(noteId))
      ..orderBy([(t) => OrderingTerm.desc(t.revisionNumber)]);
    return query.get();
  }

  Future<NoteRevision?> getRevisionById(String id) {
    return (select(noteRevisions)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> deleteRevisionsForNote(String noteId) {
    return (delete(noteRevisions)..where((t) => t.noteId.equals(noteId))).go();
  }

  Future<int> deleteRevision(String id) {
    return (delete(noteRevisions)..where((t) => t.id.equals(id))).go();
  }

  Future<int> getNextRevisionNumber(String noteId) async {
    final query = select(noteRevisions)
      ..where((t) => t.noteId.equals(noteId))
      ..limit(1)
      ..orderBy([(t) => OrderingTerm.desc(t.revisionNumber)]);
    final latest = await query.getSingleOrNull();
    return (latest?.revisionNumber ?? 0) + 1;
  }
}
