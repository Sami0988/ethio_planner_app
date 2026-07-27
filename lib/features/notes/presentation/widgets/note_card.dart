import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../shared/widgets/shared_widgets.dart';
import '../../domain/entities/note.dart';
import '../pages/note_revisions_page.dart';
import '../providers/notes_providers.dart';
import 'note_form_sheet.dart';

class NoteCard extends ConsumerWidget {
  const NoteCard({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Dismissible(
      key: Key(note.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.lg),
        color: theme.colorScheme.error,
        child: Icon(Icons.delete_outline, color: theme.colorScheme.onError),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(l10n.deleteNoteConfirmTitle),
            content: Text(l10n.deleteNoteConfirmBody(note.title)),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(l10n.deleteNoteConfirmDelete),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        ref.read(notesControllerProvider.notifier).deleteNote(note.id);
      },
      child: AppCard(
        onTap: () => NoteFormSheet.show(context, note: note),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (note.isPinned)
                  Icon(
                    Icons.push_pin,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    note.title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                PopupMenuButton<String>(
                  itemBuilder: (context) {
                    final l10n = AppLocalizations.of(context);
                    return [
                      PopupMenuItem(
                        value: 'pin',
                        child: Text(note.isPinned ? l10n.unpin : l10n.pin),
                      ),
                      PopupMenuItem(
                        value: 'archive',
                        child: Text(note.isArchived ? l10n.unarchive : l10n.archive),
                      ),
                      PopupMenuItem(
                        value: 'history',
                        child: Text(l10n.viewHistory),
                      ),
                      PopupMenuItem(value: 'delete', child: Text(l10n.delete)),
                    ];
                  },
                  onSelected: (value) async {
                    final controller = ref.read(
                      notesControllerProvider.notifier,
                    );
                    if (value == 'pin') {
                      await controller.togglePinned(note.id);
                    } else if (value == 'archive') {
                      await controller.toggleArchived(note.id);
                    } else if (value == 'history') {
                      if (context.mounted) {
                        await NoteRevisionsPage.show(context, note: note);
                      }
                    } else if (value == 'delete') {
                      await controller.deleteNote(note.id);
                    }
                  },
                ),
              ],
            ),
            if (note.content != null && note.content!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  note.content!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (note.linkedEventId != null ||
                note.linkedReminderId != null ||
                note.linkedPlannerItemId != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    if (note.linkedEventId != null)
                      Icon(Icons.event, size: 14, color: theme.colorScheme.primary),
                    if (note.linkedReminderId != null)
                      Icon(Icons.notifications, size: 14, color: theme.colorScheme.primary),
                    if (note.linkedPlannerItemId != null)
                      Icon(Icons.check_circle, size: 14, color: theme.colorScheme.primary),
                  ],
                ),
              ),
            const SizedBox(height: 4),
            Text(
              DateFormat('MMM d, y • h:mm a').format(note.updatedAt),
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
