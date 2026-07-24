import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
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
    if (items.isEmpty) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          label: l10n.sectionReminders.toUpperCase(),
          trailing: TextButton(onPressed: onSeeAll, child: Text(l10n.seeAll)),
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
                for (var i = 0; i < items.length; i++) ...[
                  TweenAnimationBuilder<double>(
                    key: ValueKey(items[i].id),
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 200 + (i * 50)),
                    curve: Curves.easeOut,
                    builder: (context, value, child) =>
                        Opacity(opacity: value, child: child),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: items[i].isCompleted ? 0.55 : 1,
                      child: CheckboxTile(
                        title: items[i].title,
                        subtitle: items[i].subtitle,
                        time: items[i].time,
                        value: items[i].isCompleted,
                        badgeStatus: items[i].isOverdue
                            ? BadgeStatus.overdue
                            : null,
                        badgeLabel: items[i].isOverdue
                            ? l10n.reminderOverdue
                            : null,
                        onChanged: (_) => onToggle?.call(items[i].id),
                      ),
                    ),
                  ),
                  if (i != items.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: context.colorDivider.withValues(alpha: 0.5),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
