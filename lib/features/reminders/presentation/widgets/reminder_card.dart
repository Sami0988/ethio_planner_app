import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/shared_widgets.dart';
import '../../domain/entities/reminder.dart';
import '../providers/reminders_providers.dart';
import '../widgets/reminder_form_sheet.dart';
import '../widgets/snooze_picker_sheet.dart';

class ReminderCard extends ConsumerWidget {
  const ReminderCard({super.key, required this.reminder});

  final Reminder reminder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();
    final isOverdue = reminder.gcDate.isBefore(now) && !reminder.isCompleted;
    final isRecurring = reminder.recurrenceRule != null;

    return Dismissible(
      key: Key(reminder.id),
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
            title: Text(l10n.actionDelete),
            content: Text('"${reminder.title}"'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(l10n.actionCancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(l10n.actionDelete),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        ref
            .read(remindersControllerProvider.notifier)
            .deleteReminder(reminder.id);
      },
      child: AppCard(
        onTap: () => ReminderFormSheet.show(context, reminder: reminder),
        child: Row(
          children: [
            Checkbox(
              value: reminder.isCompleted,
              onChanged: (_) {
                ref
                    .read(remindersControllerProvider.notifier)
                    .toggleCompleted(reminder.id);
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reminder.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      decoration: reminder.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                      color: reminder.isCompleted
                          ? theme.colorScheme.onSurfaceVariant
                          : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    DateFormat('MMM d, y • h:mm a').format(reminder.gcDate),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isOverdue
                          ? theme.colorScheme.error
                          : theme.colorScheme.onSurfaceVariant,
                      fontWeight: isOverdue ? FontWeight.w600 : null,
                    ),
                  ),
                  if (reminder.description != null &&
                      reminder.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        reminder.description!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            if (!reminder.isCompleted)
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                onSelected: (action) =>
                    _handleAction(context, ref, action, isRecurring),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'snooze',
                    child: Row(
                      children: [
                        const Icon(Icons.snooze, size: 18),
                        const SizedBox(width: 8),
                        Text(l10n.reminderSnooze),
                      ],
                    ),
                  ),
                  if (isRecurring)
                    PopupMenuItem(
                      value: 'skip',
                      child: Row(
                        children: [
                          const Icon(Icons.skip_next, size: 18),
                          const SizedBox(width: 8),
                          Text(l10n.reminderSkip),
                        ],
                      ),
                    ),
                  PopupMenuItem(
                    value: 'cancel',
                    child: Row(
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          size: 18,
                          color: theme.colorScheme.error,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n.reminderCancel,
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            if (isOverdue && reminder.isCompleted != true)
              const StatusBadge(label: 'Overdue', status: BadgeStatus.overdue),
          ],
        ),
      ),
    );
  }

  void _handleAction(
    BuildContext context,
    WidgetRef ref,
    String action,
    bool isRecurring,
  ) {
    final controller = ref.read(remindersControllerProvider.notifier);

    switch (action) {
      case 'snooze':
        _showSnoozePicker(context, controller);
        break;
      case 'skip':
        controller.skipOccurrence(reminder.id);
        break;
      case 'cancel':
        controller.cancelReminder(reminder.id);
        break;
    }
  }

  Future<void> _showSnoozePicker(
    BuildContext context,
    dynamic controller,
  ) async {
    final duration = await SnoozePickerSheet.show(context);
    if (duration != null) {
      controller.snoozeReminder(reminder.id, duration);
    }
  }
}
