import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../providers/today_view_state.dart';

/// Today's events (TODAY-FR-003, EVT-FR-006): simple time + title (+ location)
/// rows inside one card, separated by dividers.
class EventListCard extends StatelessWidget {
  const EventListCard({super.key, required this.events, this.onTapEvent});

  final List<EventPresentation> events;
  final ValueChanged<int>? onTapEvent;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(label: l10n.sectionEvents.toUpperCase()),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontalPadding,
          ),
          child: AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                for (var i = 0; i < events.length; i++) ...[
                  if (i > 0) Divider(height: 1, color: context.colorDivider),
                  _EventRow(
                    event: events[i],
                    allDayLabel: l10n.allDay,
                    onTap: onTapEvent == null ? null : () => onTapEvent!(i),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _EventRow extends StatelessWidget {
  const _EventRow({
    required this.event,
    required this.allDayLabel,
    this.onTap,
  });

  final EventPresentation event;
  final String allDayLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final timeLabel = event.isAllDay ? allDayLabel : event.time;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 68,
              child: Text(
                timeLabel ?? allDayLabel,
                style: AppTextStyles.cardSubtitle,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.title, style: AppTextStyles.cardTitle),
                  if (event.location != null) ...[
                    const SizedBox(height: 2),
                    Text(event.location!, style: AppTextStyles.cardSubtitle),
                  ],
                ],
              ),
            ),
            if (event.isPending)
              Icon(Icons.sync_rounded, size: 14, color: context.colorTextMuted),
          ],
        ),
      ),
    );
  }
}
