import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_spacing.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontalPadding,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: AppColorsLight.primary,
              shape: const CircleBorder(),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!, style: AppTextStyles.cardSubtitle),
                ],
              ],
            ),
          ),
          if (time != null) ...[
            Text(time!, style: AppTextStyles.timeLabel),
            const SizedBox(width: AppSpacing.sm),
          ],
          if (badgeStatus != null && badgeLabel != null)
            StatusBadge(label: badgeLabel!, status: badgeStatus!),
        ],
      ),
    );
  }
}
