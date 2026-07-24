import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/notes_providers.dart';
import '../providers/notes_view_state.dart';
import '../widgets/note_card.dart';
import '../widgets/note_form_sheet.dart';

class NotesPage extends ConsumerStatefulWidget {
  const NotesPage({super.key});

  @override
  ConsumerState<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends ConsumerState<NotesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initAndLoad();
    });
  }

  void _initAndLoad() {
    final controller = ref.read(notesControllerProvider.notifier);
    controller.setDependencies(
      getAllNotes: ref.read(getAllNotesProvider),
      searchNotes: ref.read(searchNotesProvider),
      createNote: ref.read(createNoteProvider),
      updateNote: ref.read(updateNoteProvider),
      deleteNote: ref.read(deleteNoteProvider),
      togglePinned: ref.read(toggleNotePinnedProvider),
      toggleArchived: ref.read(toggleNoteArchivedProvider),
    );
    controller.loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notesControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => NoteFormSheet.show(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _NotesFilterBar(
            currentFilter: state.filter,
            onFilterChanged: (filter) {
              ref.read(notesControllerProvider.notifier).setFilter(filter);
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.filteredNotes.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.note_alt_outlined,
                              size: 64,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No notes',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tap + to create a note',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: state.filteredNotes.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final note = state.filteredNotes[index];
                          return NoteCard(note: note);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class _NotesFilterBar extends StatelessWidget {
  const _NotesFilterBar({
    required this.currentFilter,
    required this.onFilterChanged,
  });

  final NotesFilter currentFilter;
  final void Function(NotesFilter) onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: NotesFilter.values.map((filter) {
          final isSelected = currentFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(_filterLabel(filter)),
              selected: isSelected,
              onSelected: (_) => onFilterChanged(filter),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _filterLabel(NotesFilter filter) {
    switch (filter) {
      case NotesFilter.all:
        return 'All';
      case NotesFilter.pinned:
        return 'Pinned';
      case NotesFilter.archived:
        return 'Archived';
    }
  }
}
