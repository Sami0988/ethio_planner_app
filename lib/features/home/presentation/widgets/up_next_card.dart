import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_spacing.dart';
import '../providers/today_view_state.dart';

class UpNextCard extends StatelessWidget {
  final UpNextItem item;

  const UpNextCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(label: 'UP NEXT'),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontalPadding,
          ),
          child: AppCard(
            color: AppColorsLight.primaryLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.time, style: AppTextStyles.timeLabel),
                const SizedBox(height: AppSpacing.xs),
                Text(item.title, style: AppTextStyles.cardTitle),
                const SizedBox(height: 2),
                Text(item.subtitle, style: AppTextStyles.cardSubtitle),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Icon(
                      _iconForType(item.type),
                      size: 14,
                      color: AppColorsLight.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.type,
                      style: AppTextStyles.badge.copyWith(
                        color: AppColorsLight.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  IconData _iconForType(String type) {
    switch (type.toLowerCase()) {
      case 'meeting':
        return Icons.groups_rounded;
      case 'personal':
        return Icons.person_rounded;
      case 'work':
        return Icons.work_rounded;
      default:
        return Icons.event_rounded;
    }
  }
}
