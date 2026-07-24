import '../entities/note.dart';
import '../repositories/note_repository.dart';

class GetAllNotes {
  final NoteRepository _repository;

  GetAllNotes(this._repository);

  Future<List<Note>> call() async {
    return _repository.getAllNotes();
  }
}

class SearchNotes {
  final NoteRepository _repository;

  SearchNotes(this._repository);

  Future<List<Note>> call(String query) async {
    return _repository.searchNotes(query);
  }
}

class CreateNote {
  final NoteRepository _repository;

  CreateNote(this._repository);

  Future<void> call(Note note) async {
    await _repository.createNote(note);
  }
}

class UpdateNote {
  final NoteRepository _repository;

  UpdateNote(this._repository);

  Future<void> call(Note note) async {
    await _repository.updateNote(note);
  }
}

class DeleteNote {
  final NoteRepository _repository;

  DeleteNote(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteNote(id);
  }
}

class ToggleNotePinned {
  final NoteRepository _repository;

  ToggleNotePinned(this._repository);

  Future<void> call(String id) async {
    await _repository.togglePinned(id);
  }
}

class ToggleNoteArchived {
  final NoteRepository _repository;

  ToggleNoteArchived(this._repository);

  Future<void> call(String id) async {
    await _repository.toggleArchived(id);
  }
}
