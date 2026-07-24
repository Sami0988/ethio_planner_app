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
    if (events.isEmpty) return const SizedBox.shrink();

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
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 200 + (i * 50)),
                    curve: Curves.easeOut,
                    builder: (context, value, child) =>
                        Opacity(opacity: value, child: child),
                    child: _EventRow(
                      event: events[i],
                      allDayLabel: l10n.allDay,
                      onTap:
                          onTapEvent == null ? null : () => onTapEvent!(i),
                    ),
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
    final timeLabel = event.isAllDay ? allDayLabel : (event.time ?? '');

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: context.colorPrimary.withOpacity(0.04),
        splashColor: context.colorPrimary.withOpacity(0.06),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 68,
                child: Text(
                  timeLabel,
                  style: AppTextStyles.cardSubtitle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colorTextSecondary,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: AppTextStyles.cardTitle.copyWith(
                        color: context.colorTextPrimary,
                      ),
                    ),
                    if (event.location != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            size: 12,
                            color: context.colorTextMuted,
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              event.location!,
                              style: AppTextStyles.cardSubtitle.copyWith(
                                color: context.colorTextSecondary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              if (event.isPending)
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: _SpinningSyncIcon(),
                )
              else if (onTap != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 18,
                    color: context.colorTextMuted,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpinningSyncIcon extends StatefulWidget {
  const _SpinningSyncIcon();

  @override
  State<_SpinningSyncIcon> createState() => _SpinningSyncIconState();
}

class _SpinningSyncIconState extends State<_SpinningSyncIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Icon(
        Icons.sync_rounded,
        size: 14,
        color: context.colorTextMuted,
      ),
    );
  }
}