import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/checkbox_tile.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../providers/today_view_state.dart';

/// Today's reminders (TODAY-FR-004, REM-FR-004). Overdue is shown with a
/// labelled badge and text, never colour alone (REM-FR: "Do not communicate
/// overdue status by red colour only").
class TodayReminders extends StatelessWidget {
  const TodayReminders({
    super.key,
    required this.items,
    this.onToggle,
    this.onSeeAll,
  });

  final List<ReminderPresentation> items;
  final ValueChanged<String>? onToggle;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          label: l10n.sectionReminders.toUpperCase(),
          trailing: TextButton(
            onPressed: onSeeAll,
            child: Text(l10n.seeAll),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontalPadding,
          ),
          child: AppCard(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Column(
              children: [
                for (final item in items)
                  CheckboxTile(
                    title: item.title,
                    subtitle: item.subtitle,
                    time: item.time,
                    value: item.isCompleted,
                    badgeStatus: item.isOverdue ? BadgeStatus.overdue : null,
                    badgeLabel: item.isOverdue ? l10n.reminderOverdue : null,
                    onChanged: (_) => onToggle?.call(item.id),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
