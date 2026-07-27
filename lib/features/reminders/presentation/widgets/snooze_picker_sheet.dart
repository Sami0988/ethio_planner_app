import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';

/// Duration options for snoozing a reminder.
class SnoozeOption {
  const SnoozeOption({required this.label, required this.duration});

  final String label;
  final Duration duration;

  static List<SnoozeOption> defaults(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return [
      SnoozeOption(
        label: l10n.snooze15Minutes,
        duration: const Duration(minutes: 15),
      ),
      SnoozeOption(
        label: l10n.snooze30Minutes,
        duration: const Duration(minutes: 30),
      ),
      SnoozeOption(label: l10n.snooze1Hour, duration: const Duration(hours: 1)),
      SnoozeOption(
        label: l10n.snooze2Hours,
        duration: const Duration(hours: 2),
      ),
      SnoozeOption(
        label: l10n.snoozeTomorrow,
        duration: const Duration(days: 1),
      ),
    ];
  }
}

/// Bottom sheet for selecting a snooze duration.
class SnoozePickerSheet extends StatelessWidget {
  const SnoozePickerSheet({super.key});

  static Future<Duration?> show(BuildContext context) {
    return showModalBottomSheet<Duration>(
      context: context,
      builder: (_) => const SnoozePickerSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final options = SnoozeOption.defaults(context);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: AppSpacing.sm),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text(
              l10n.snoozeReminder,
              style: theme.textTheme.titleMedium,
            ),
          ),
          ...options.map(
            (option) => ListTile(
              leading: const Icon(Icons.snooze),
              title: Text(option.label),
              onTap: () => Navigator.of(context).pop(option.duration),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ),
    );
  }
}
