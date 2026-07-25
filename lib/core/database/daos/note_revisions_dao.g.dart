// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_revisions_dao.dart';

// ignore_for_file: type=lint
mixin _$NoteRevisionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $NoteRevisionsTable get noteRevisions => attachedDatabase.noteRevisions;
  NoteRevisionsDaoManager get managers => NoteRevisionsDaoManager(this);
}

class NoteRevisionsDaoManager {
  final _$NoteRevisionsDaoMixin _db;
  NoteRevisionsDaoManager(this._db);
  $$NoteRevisionsTableTableManager get noteRevisions =>
      $$NoteRevisionsTableTableManager(_db.attachedDatabase, _db.noteRevisions);
}
