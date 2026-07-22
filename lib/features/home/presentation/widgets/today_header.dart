import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_spacing.dart';

class TodayHeader extends StatelessWidget {
  final String ecDateLabel;
  final String gcDateLabel;

  const TodayHeader({
    super.key,
    required this.ecDateLabel,
    required this.gcDateLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontalPadding,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ecDateLabel, style: AppTextStyles.ecDateHeading),
                const SizedBox(height: 4),
                Text(gcDateLabel, style: AppTextStyles.gcDateSubtitle),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
