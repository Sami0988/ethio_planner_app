import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Quick Add action sheet (APP-FR-002): lets the user choose the item type
/// before any editor opens. Navigation is via go_router.
class QuickAddSheet extends StatelessWidget {
  const QuickAddSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => const QuickAddSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.quickAddTitle, style: AppTextStyles.cardTitle),
            const SizedBox(height: AppSpacing.md),
            // Interim targets until dedicated editors exist (Phase 1B/1C).
            _QuickAddOption(
              icon: Icons.event_rounded,
              label: l10n.quickAddEvent,
              onTap: () => _go(context, RouteNames.calendar),
            ),
            _QuickAddOption(
              icon: Icons.notifications_rounded,
              label: l10n.quickAddReminder,
              onTap: () => _go(context, RouteNames.reminders),
            ),
            _QuickAddOption(
              icon: Icons.sticky_note_2_rounded,
              label: l10n.quickAddNote,
              onTap: () => _go(context, RouteNames.planner),
            ),
          ],
        ),
      ),
    );
  }

  void _go(BuildContext context, String route) {
    Navigator.of(context).pop();
    context.go(route);
  }
}

class _QuickAddOption extends StatelessWidget {
  const _QuickAddOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label, style: AppTextStyles.cardTitle),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
