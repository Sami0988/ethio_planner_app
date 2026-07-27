import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
class TodayReminders extends StatefulWidget {
  const TodayReminders({
    super.key,
    required this.items,
    this.onToggle,
    this.onDelete,
    this.onSnooze,
    this.onSeeAll,
  });

  final List<ReminderPresentation> items;
  final ValueChanged<String>? onToggle;
  final ValueChanged<String>? onDelete;
  final void Function(String id, Duration duration)? onSnooze;
  final VoidCallback? onSeeAll;

  @override
  State<TodayReminders> createState() => _TodayRemindersState();
}

class _TodayRemindersState extends State<TodayReminders> {
  final Set<String> _completingIds = {};
  final Set<String> _deletingIds = {};

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          label: l10n.sectionReminders.toUpperCase(),
          trailing: TextButton(
            onPressed: widget.onSeeAll,
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
                for (var i = 0; i < widget.items.length; i++) ...[
                  _SwipeableReminder(
                    key: ValueKey(widget.items[i].id),
                    reminder: widget.items[i],
                    isCompleting: _completingIds.contains(widget.items[i].id),
                    isDeleting: _deletingIds.contains(widget.items[i].id),
                    onToggle: (id) {
                      setState(() => _completingIds.add(id));
                      widget.onToggle?.call(id);
                      Future.delayed(const Duration(milliseconds: 400), () {
                        if (mounted) setState(() => _completingIds.remove(id));
                      });
                    },
                    onDelete: (id) {
                      setState(() => _deletingIds.add(id));
                      Future.delayed(const Duration(milliseconds: 300), () {
                        widget.onDelete?.call(id);
                      });
                    },
                    onSnooze: widget.onSnooze,
                    l10n: l10n,
                  ),
                  if (i != widget.items.length - 1)
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

class _SwipeableReminder extends StatelessWidget {
  const _SwipeableReminder({
    super.key,
    required this.reminder,
    required this.isCompleting,
    required this.isDeleting,
    required this.onToggle,
    required this.onDelete,
    required this.onSnooze,
    required this.l10n,
  });

  final ReminderPresentation reminder;
  final bool isCompleting;
  final bool isDeleting;
  final ValueChanged<String> onToggle;
  final ValueChanged<String> onDelete;
  final void Function(String id, Duration duration)? onSnooze;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(reminder.id),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          onDelete(reminder.id);
          return false;
        } else {
          onToggle(reminder.id);
          return false;
        }
      },
      background: _SwipeBackground(
        icon: Icons.check_rounded,
        label: l10n.complete,
        color: context.colorSuccess,
        alignment: Alignment.centerLeft,
      ),
      secondaryBackground: _SwipeBackground(
        icon: Icons.delete_outline_rounded,
        label: l10n.delete,
        color: context.colorOverdue,
        alignment: Alignment.centerRight,
      ),
      child: GestureDetector(
        onLongPress: () => _showSnoozeMenu(context),
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: Duration(milliseconds: isDeleting ? 250 : 300),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: isDeleting ? 1 - value : value,
              child: Transform.translate(
                offset: Offset(isDeleting ? 30 * (1 - value) : 0, 0),
                child: child,
              ),
            );
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: reminder.isCompleted ? 0.55 : 1,
            child: CheckboxTile(
              title: reminder.title,
              subtitle: reminder.subtitle,
              time: reminder.time,
              value: reminder.isCompleted,
              badgeStatus: reminder.isOverdue
                  ? BadgeStatus.overdue
                  : null,
              badgeLabel: reminder.isOverdue
                  ? l10n.reminderOverdue
                  : null,
              onChanged: (_) => onToggle(reminder.id),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnoozeMenu(BuildContext context) {
    if (onSnooze == null) return;
    HapticFeedback.mediumImpact();

    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                reminder.title,
                style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.md),
              ListTile(
                leading: const Icon(Icons.access_time_rounded),
                title: Text(l10n.snoozeOneHour),
                onTap: () {
                  Navigator.of(ctx).pop();
                  onSnooze!(reminder.id, const Duration(hours: 1));
                },
              ),
              ListTile(
                leading: const Icon(Icons.wb_sunny_rounded),
                title: Text(l10n.snoozeTomorrow),
                onTap: () {
                  Navigator.of(ctx).pop();
                  final tomorrow = DateTime.now().add(const Duration(days: 1));
                  final target = DateTime(
                    tomorrow.year,
                    tomorrow.month,
                    tomorrow.day,
                    9,
                  );
                  onSnooze!(
                    reminder.id,
                    target.difference(DateTime.now()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SwipeBackground extends StatelessWidget {
  const _SwipeBackground({
    required this.icon,
    required this.label,
    required this.color,
    required this.alignment,
  });

  final IconData icon;
  final String label;
  final Color color;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      color: color.withValues(alpha: 0.15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
