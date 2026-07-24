import 'package:flutter/material.dart';

import '../../core/accessibility/accessibility_helper.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import 'status_badge.dart';

class CheckboxTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? time;
  final BadgeStatus? badgeStatus;
  final String? badgeLabel;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CheckboxTile({
    super.key,
    required this.title,
    this.subtitle,
    this.time,
    this.badgeStatus,
    this.badgeLabel,
    this.value = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$title${subtitle != null ? ', $subtitle' : ''}',
      hint: value ? 'Completed' : 'Not completed. Double tap to toggle.',
      checked: value,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenHorizontalPadding,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          children: [
            SizedBox(
              width: AccessibilityHelper.minTouchTarget,
              height: AccessibilityHelper.minTouchTarget,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: context.colorPrimary,
                shape: const CircleBorder(),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.cardTitle.copyWith(
                      color: context.colorTextPrimary,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: AppTextStyles.cardSubtitle.copyWith(
                        color: context.colorTextSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (time != null) ...[
              Text(
                time!,
                style: AppTextStyles.timeLabel.copyWith(
                  color: context.colorPrimary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
            ],
            if (badgeStatus != null && badgeLabel != null)
              StatusBadge(label: badgeLabel!, status: badgeStatus!),
          ],
        ),
      ),
    );
  }
}
