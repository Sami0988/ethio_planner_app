import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/primary_button.dart';

/// Calm, non-judgemental empty state for a day with nothing scheduled
/// (TODAY-FR-014: no productivity scores or judgemental messaging).
class TodayEmptyState extends StatelessWidget {
  const TodayEmptyState({super.key, this.onAdd});

  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny_rounded, size: 64, color: context.colorHoliday),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.emptyTodayTitle,
              style: AppTextStyles.ecDateHeading.copyWith(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.emptyTodayBody,
              style: AppTextStyles.cardSubtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(label: l10n.addSomething, onPressed: onAdd),
          ],
        ),
      ),
    );
  }
}
