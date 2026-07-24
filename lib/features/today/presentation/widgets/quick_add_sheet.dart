import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../calendar/presentation/widgets/event_form_sheet.dart';
import '../../../notes/presentation/widgets/note_form_sheet.dart';
import '../../../reminders/presentation/widgets/reminder_form_sheet.dart';

/// Quick Add action sheet (APP-FR-002): lets the user pick an item type and
/// opens the matching editor directly, so "Add Reminder" lands on the reminder
/// editor rather than a list screen.
class QuickAddSheet extends StatelessWidget {
  const QuickAddSheet({super.key, required this.parentContext});

  /// The page context used to open the editor after this sheet is dismissed
  /// (this sheet's own context is gone once it pops).
  final BuildContext parentContext;

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => QuickAddSheet(parentContext: context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.sm,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.quickAddTitle,
              style: AppTextStyles.cardTitle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _QuickAddOption(
              icon: Icons.event_rounded,
              label: l10n.quickAddEvent,
              color: context.colorPrimary,
              onTap: () => _open(context, () => EventFormSheet.show(parentContext)),
            ),
            const SizedBox(height: AppSpacing.sm),
            _QuickAddOption(
              icon: Icons.notifications_rounded,
              label: l10n.quickAddReminder,
              color: context.colorHoliday,
              onTap: () =>
                  _open(context, () => ReminderFormSheet.show(parentContext)),
            ),
            const SizedBox(height: AppSpacing.sm),
            _QuickAddOption(
              icon: Icons.sticky_note_2_rounded,
              label: l10n.quickAddNote,
              color: context.colorSuccess,
              onTap: () => _open(context, () => NoteFormSheet.show(parentContext)),
            ),
          ],
        ),
      ),
    );
  }

  /// Dismisses this sheet, then opens the chosen editor on the page context.
  void _open(BuildContext sheetContext, VoidCallback openEditor) {
    HapticFeedback.selectionClick();
    Navigator.of(sheetContext).pop();
    openEditor();
  }
}

class _QuickAddOption extends StatefulWidget {
  const _QuickAddOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_QuickAddOption> createState() => _QuickAddOptionState();
}

class _QuickAddOptionState extends State<_QuickAddOption> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: AppRadii.card as BorderRadius?,
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.98 : 1,
          duration: const Duration(milliseconds: 100),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              color: context.colorSurfaceMuted,
              borderRadius: AppRadii.card,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(widget.icon, color: widget.color, size: 22),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    widget.label,
                    style: AppTextStyles.cardTitle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: context.colorTextMuted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
