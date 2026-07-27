import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

/// Result of the edit-occurrence dialog.
enum EditOccurrenceChoice { thisOccurrence, allOccurrences }

/// Dialog shown when a user edits a recurring event/reminder.
/// Asks whether to edit just this occurrence or the entire series.
class EditOccurrenceDialog extends StatelessWidget {
  const EditOccurrenceDialog({super.key, required this.entityTitle});

  final String entityTitle;

  static Future<EditOccurrenceChoice?> show(
    BuildContext context, {
    required String entityTitle,
  }) {
    return showDialog<EditOccurrenceChoice>(
      context: context,
      builder: (_) => EditOccurrenceDialog(entityTitle: entityTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      icon: Icon(Icons.event_repeat, color: theme.colorScheme.primary),
      title: Text(l10n.editOccurrenceTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"$entityTitle"',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(l10n.editOccurrenceMessage, style: theme.textTheme.bodyMedium),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(EditOccurrenceChoice.thisOccurrence),
          child: Text(l10n.editThisOccurrence),
        ),
        FilledButton(
          onPressed: () =>
              Navigator.of(context).pop(EditOccurrenceChoice.allOccurrences),
          child: Text(l10n.editAllOccurrences),
        ),
      ],
    );
  }
}

/// Dialog shown when a user deletes a recurring event/reminder.
/// Asks whether to delete just this occurrence or the entire series.
class DeleteOccurrenceDialog extends StatelessWidget {
  const DeleteOccurrenceDialog({super.key, required this.entityTitle});

  final String entityTitle;

  static Future<EditOccurrenceChoice?> show(
    BuildContext context, {
    required String entityTitle,
  }) {
    return showDialog<EditOccurrenceChoice>(
      context: context,
      builder: (_) => DeleteOccurrenceDialog(entityTitle: entityTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
      title: Text(l10n.deleteOccurrenceTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"$entityTitle"',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(l10n.deleteOccurrenceMessage, style: theme.textTheme.bodyMedium),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(EditOccurrenceChoice.thisOccurrence),
          child: Text(l10n.deleteThisOccurrence),
        ),
        FilledButton(
          onPressed: () =>
              Navigator.of(context).pop(EditOccurrenceChoice.allOccurrences),
          style: FilledButton.styleFrom(
            backgroundColor: theme.colorScheme.error,
          ),
          child: Text(l10n.deleteAllOccurrences),
        ),
      ],
    );
  }
}
