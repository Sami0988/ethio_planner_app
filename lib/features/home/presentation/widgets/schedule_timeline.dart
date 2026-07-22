import 'package:flutter/material.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_spacing.dart';
import '../providers/today_view_state.dart';

class ScheduleTimeline extends StatelessWidget {
  final List<ScheduleItem> items;

  const ScheduleTimeline({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(label: 'SCHEDULE'),
        const SizedBox(height: AppSpacing.sm),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final isLast = index == items.length - 1;
            return _TimelineTile(item: item, isLast: isLast);
          },
        ),
      ],
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final ScheduleItem item;
  final bool isLast;

  const _TimelineTile({required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              item.time,
              style: AppTextStyles.timeLabel,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _dotColor,
                  shape: BoxShape.circle,
                  border: item.status == ScheduleStatus.upcoming
                      ? Border.all(color: AppColorsLight.primary, width: 2)
                      : null,
                ),
                child: item.status == ScheduleStatus.done
                    ? const Icon(Icons.check, size: 8, color: Colors.white)
                    : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColorsLight.timelineTrack,
                  ),
                ),
            ],
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: AppTextStyles.cardTitle),
                  const SizedBox(height: 2),
                  Text(item.subtitle, style: AppTextStyles.cardSubtitle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color get _dotColor {
    switch (item.status) {
      case ScheduleStatus.done:
        return AppColorsLight.success;
      case ScheduleStatus.current:
        return AppColorsLight.primary;
      case ScheduleStatus.upcoming:
        return Colors.transparent;
    }
  }
}
