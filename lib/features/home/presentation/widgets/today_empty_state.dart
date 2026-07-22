import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/primary_button.dart';

class TodayEmptyState extends StatelessWidget {
  final VoidCallback? onAdd;

  const TodayEmptyState({super.key, this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wb_sunny_rounded,
              size: 64,
              color: Colors.amber[300],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'A fresh start',
              style: AppTextStyles.ecDateHeading.copyWith(fontSize: 22),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'No events or reminders for today.\nAdd something to get started.',
              style: AppTextStyles.cardSubtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: '+ Add Something',
              onPressed: onAdd,
            ),
          ],
        ),
      ),
    );
  }
}
