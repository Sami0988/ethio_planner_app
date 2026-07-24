import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/database_provider.dart';
import '../../data/datasources/note_local_datasource.dart';
import '../../data/repositories/note_repository_impl.dart';
import '../../domain/usecases/get_notes.dart';
import '../controllers/notes_controller.dart';
import 'notes_view_state.dart';

final noteLocalDatasourceProvider = Provider<NoteLocalDatasource>(
  (ref) => NoteLocalDatasource(ref.watch(databaseProvider)),
);

final noteRepositoryProvider = Provider<NoteRepositoryImpl>(
  (ref) => NoteRepositoryImpl(
    localDatasource: ref.watch(noteLocalDatasourceProvider),
  ),
);

final getAllNotesProvider = Provider<GetAllNotes>(
  (ref) => GetAllNotes(ref.watch(noteRepositoryProvider)),
);

final searchNotesProvider = Provider<SearchNotes>(
  (ref) => SearchNotes(ref.watch(noteRepositoryProvider)),
);

final createNoteProvider = Provider<CreateNote>(
  (ref) => CreateNote(ref.watch(noteRepositoryProvider)),
);

final updateNoteProvider = Provider<UpdateNote>(
  (ref) => UpdateNote(ref.watch(noteRepositoryProvider)),
);

final deleteNoteProvider = Provider<DeleteNote>(
  (ref) => DeleteNote(ref.watch(noteRepositoryProvider)),
);

final toggleNotePinnedProvider = Provider<ToggleNotePinned>(
  (ref) => ToggleNotePinned(ref.watch(noteRepositoryProvider)),
);

final toggleNoteArchivedProvider = Provider<ToggleNoteArchived>(
  (ref) => ToggleNoteArchived(ref.watch(noteRepositoryProvider)),
);

final notesControllerProvider =
    NotifierProvider<NotesController, NotesViewState>(NotesController.new);
