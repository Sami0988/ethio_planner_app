import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/section_header.dart';
import '../providers/today_view_state.dart';

/// Vertical timeline showing today's schedule items (TODAY-FR-003).
/// Each item displays a time label on the left and an event card on the right,
/// connected by a vertical track line.
class TodayScheduleTimeline extends StatelessWidget {
  const TodayScheduleTimeline({super.key, required this.items});

  final List<SchedulePresentation> items;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(label: l10n.sectionTodaySchedule.toUpperCase()),
        const SizedBox(height: AppSpacing.md),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontalPadding,
          ),
          child: Column(
            children: [
              for (var i = 0; i < items.length; i++)
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: Duration(milliseconds: 250 + (i * 60)),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) => Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(12 * (1 - value), 0),
                      child: child,
                    ),
                  ),
                  child: _TimelineEntry(
                    item: items[i],
                    isLast: i == items.length - 1,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({required this.item, required this.isLast});

  final SchedulePresentation item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time label
          SizedBox(
            width: 52,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                item.time,
                style: AppTextStyles.timeLabel.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: item.isCompleted
                      ? context.colorTextMuted
                      : context.colorTextPrimary,
                ),
              ),
            ),
          ),
          // Timeline track + dot
          SizedBox(
            width: 20,
            child: Column(
              children: [
                const SizedBox(height: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: item.isCompleted ? 18 : 12,
                  height: item.isCompleted ? 18 : 12,
                  decoration: BoxDecoration(
                    color: item.isCompleted
                        ? context.colorCompleted
                        : context.colorPrimary,
                    shape: BoxShape.circle,
                    boxShadow: item.isCompleted
                        ? []
                        : [
                            BoxShadow(
                              color: context.colorPrimary.withValues(
                                alpha: 0.25,
                              ),
                              blurRadius: 6,
                              spreadRadius: 2,
                            ),
                          ],
                  ),
                  child: item.isCompleted
                      ? const Icon(
                          Icons.check_rounded,
                          size: 12,
                          color: Colors.white,
                        )
                      : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: item.isCompleted
                            ? context.colorCompleted.withValues(alpha: 0.4)
                            : context.colorTimelineTrack,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          // Event card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: AppRadii.card as BorderRadius?,
                  onTap: () {},
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: context.colorSurfaceMuted,
                      borderRadius: AppRadii.card,
                      border: Border(
                        left: BorderSide(
                          color: item.isCompleted
                              ? context.colorCompleted
                              : context.colorPrimary,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.title,
                            style: AppTextStyles.cardTitle.copyWith(
                              fontSize: 15,
                              color: item.isCompleted
                                  ? context.colorTextMuted
                                  : context.colorTextPrimary,
                              decoration: item.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          if (item.subtitle != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              item.subtitle!,
                              style: AppTextStyles.cardSubtitle.copyWith(
                                color: item.isCompleted
                                    ? context.colorCompleted
                                    : context.colorTextSecondary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
