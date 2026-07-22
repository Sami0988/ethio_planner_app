import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/section_header.dart';
import '../providers/today_view_state.dart';

/// The nearest important upcoming item (TODAY-FR-010), shown as one semantic
/// group with a coloured accent bar.
class UpNextCard extends StatelessWidget {
  const UpNextCard({super.key, required this.item});

  final UpNextPresentation item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final timeLabel = item.isAllDay ? l10n.allDay : item.time;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(label: l10n.sectionUpNext.toUpperCase()),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontalPadding,
          ),
          child: MergeSemantics(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorPrimaryLight,
                borderRadius: AppRadii.card,
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 4,
                      decoration: BoxDecoration(
                        color: context.colorPrimary,
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(AppRadii.md),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.cardPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (timeLabel != null)
                              Text(
                                timeLabel,
                                style: AppTextStyles.timeLabel
                                    .copyWith(color: context.colorPrimary),
                              ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(item.title, style: AppTextStyles.cardTitle),
                            if (item.subtitle != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                item.subtitle!,
                                style: AppTextStyles.cardSubtitle,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
