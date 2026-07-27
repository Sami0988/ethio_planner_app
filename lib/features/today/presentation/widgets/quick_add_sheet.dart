import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../calendar/presentation/widgets/event_form_sheet.dart';
import '../../../notes/presentation/widgets/note_form_sheet.dart';
import '../../../reminders/presentation/widgets/reminder_form_sheet.dart';

const _lastUsedKey = 'quick_add_last_type';

class QuickAddSheet extends StatefulWidget {
  const QuickAddSheet({super.key, required this.parentContext});

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
  State<QuickAddSheet> createState() => _QuickAddSheetState();
}

class _QuickAddSheetState extends State<QuickAddSheet> {
  String? _lastUsedType;

  @override
  void initState() {
    super.initState();
    _loadLastUsed();
  }

  Future<void> _loadLastUsed() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _lastUsedType = prefs.getString(_lastUsedKey));
  }

  Future<void> _saveLastUsed(String type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastUsedKey, type);
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
            if (_lastUsedType != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.quickAddLastUsed(_lastUsedLabel(_lastUsedType!, l10n)),
                style: AppTextStyles.cardSubtitle.copyWith(
                  color: context.colorPrimary,
                  fontSize: 12,
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            _QuickAddOption(
              icon: Icons.event_rounded,
              label: l10n.quickAddEvent,
              color: context.colorPrimary,
              isLastUsed: _lastUsedType == 'event',
              onTap: () => _open('event', () => EventFormSheet.show(widget.parentContext)),
            ),
            const SizedBox(height: AppSpacing.sm),
            _QuickAddOption(
              icon: Icons.notifications_rounded,
              label: l10n.quickAddReminder,
              color: context.colorHoliday,
              isLastUsed: _lastUsedType == 'reminder',
              onTap: () => _open('reminder', () => ReminderFormSheet.show(widget.parentContext)),
            ),
            const SizedBox(height: AppSpacing.sm),
            _QuickAddOption(
              icon: Icons.sticky_note_2_rounded,
              label: l10n.quickAddNote,
              color: context.colorSuccess,
              isLastUsed: _lastUsedType == 'note',
              onTap: () => _open('note', () => NoteFormSheet.show(widget.parentContext)),
            ),
          ],
        ),
      ),
    );
  }

  String _lastUsedLabel(String type, AppLocalizations l10n) {
    switch (type) {
      case 'event':
        return l10n.quickAddEvent;
      case 'reminder':
        return l10n.quickAddReminder;
      case 'note':
        return l10n.quickAddNote;
      default:
        return type;
    }
  }

  void _open(String type, VoidCallback openEditor) {
    HapticFeedback.selectionClick();
    _saveLastUsed(type);
    Navigator.of(context).pop();
    openEditor();
  }
}

class _QuickAddOption extends StatefulWidget {
  const _QuickAddOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    this.isLastUsed = false,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool isLastUsed;

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
              color: widget.isLastUsed
                  ? context.colorPrimary.withValues(alpha: 0.08)
                  : context.colorSurfaceMuted,
              borderRadius: AppRadii.card,
              border: widget.isLastUsed
                  ? Border.all(
                      color: context.colorPrimary.withValues(alpha: 0.3),
                    )
                  : null,
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
                if (widget.isLastUsed)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorPrimary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Last',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: context.colorPrimary,
                      ),
                    ),
                  )
                else
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
