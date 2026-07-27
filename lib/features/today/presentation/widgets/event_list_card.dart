import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../providers/today_view_state.dart';

/// Event type colors for the dot legend and row indicators.
const _eventTypeColors = [
  Color(0xFF6366F1), // Indigo
  Color(0xFFEC4899), // Pink
  Color(0xFFF59E0B), // Amber
  Color(0xFF10B981), // Emerald
  Color(0xFF3B82F6), // Blue
];

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
        // Color legend
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontalPadding,
          ),
          child: Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.xs,
            children: [
              _LegendDot(color: _eventTypeColors[0], label: l10n.eventTypeMeeting),
              _LegendDot(color: _eventTypeColors[1], label: l10n.eventTypePersonal),
              _LegendDot(color: _eventTypeColors[2], label: l10n.eventTypeDeadline),
              _LegendDot(color: _eventTypeColors[3], label: l10n.eventTypeHealth),
              _LegendDot(color: _eventTypeColors[4], label: l10n.eventTypeOther),
            ],
          ),
        ),
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
                      colorIndex: i % _eventTypeColors.length,
                      onTap: onTapEvent == null ? null : () => onTapEvent!(i),
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

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: context.colorTextMuted,
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
    required this.colorIndex,
    this.onTap,
  });

  final EventPresentation event;
  final String allDayLabel;
  final int colorIndex;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final timeLabel = event.isAllDay ? allDayLabel : (event.time ?? '');
    final eventColor = _eventTypeColors[colorIndex % _eventTypeColors.length];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: context.colorPrimary.withValues(alpha: 0.04),
        splashColor: context.colorPrimary.withValues(alpha: 0.06),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Color dot indicator
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  width: 4,
                  height: 32,
                  decoration: BoxDecoration(
                    color: eventColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              SizedBox(
                width: 60,
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
      child: Icon(Icons.sync_rounded, size: 14, color: context.colorTextMuted),
    );
  }
}
