import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../formatting/today_date_formatter.dart';
import '../providers/today_view_state.dart';

/// Dual-calendar date header (TODAY-FR-001, CAL-FR-003): Ethiopian date
/// prominent, Gregorian secondary, with an optional holiday badge.
class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
    required this.ethiopianDate,
    required this.gregorianDate,
    this.holiday,
  });

  final EthiopianDate ethiopianDate;
  final GregorianDate gregorianDate;
  final HolidayPresentation? holiday;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final formatter =
        TodayDateFormatter(Localizations.localeOf(context).languageCode);

    final ecMain = formatter.ethiopianMonthDayYear(ethiopianDate);
    final weekday = formatter.weekday(gregorianDate);
    final gcMain = formatter.gregorianMonthDayYear(gregorianDate);
    final holidayInfo = holiday;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontalPadding,
        vertical: AppSpacing.md,
      ),
      child: MergeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: ecMain, style: AppTextStyles.ecDateHeading),
                  TextSpan(
                    text: ' ${l10n.ecSuffix}',
                    style: AppTextStyles.ecDateHeading.copyWith(
                      fontSize: 16,
                      color: context.colorPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.xs,
              children: [
                if (holidayInfo != null)
                  Semantics(
                    label: '${holidayInfo.name}, ${holidayInfo.type}',
                    child: StatusBadge(
                      label: holidayInfo.name,
                      status: BadgeStatus.holiday,
                    ),
                  ),
                Text(
                  '$weekday · $gcMain ${l10n.gcSuffix}',
                  style: AppTextStyles.gcDateSubtitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
