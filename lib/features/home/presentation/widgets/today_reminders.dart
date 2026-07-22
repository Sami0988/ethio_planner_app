import 'package:flutter/material.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../shared/widgets/checkbox_tile.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../../../core/theme/app_spacing.dart';
import '../providers/today_view_state.dart';

class TodayReminders extends StatelessWidget {
  final List<ReminderItem> items;
  final ValueChanged<int>? onToggle;

  const TodayReminders({
    super.key,
    required this.items,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          label: 'REMINDERS',
          trailing: TextButton(
            onPressed: () {},
            child: const Text('See all'),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return CheckboxTile(
              title: item.title,
              subtitle: item.subtitle,
              time: item.time,
              badgeStatus: item.badgeStatus == true
                  ? BadgeStatus.holiday
                  : null,
              badgeLabel: item.badgeLabel,
              value: item.isCompleted,
              onChanged: (_) => onToggle?.call(index),
            );
          },
        ),
      ],
    );
  }
}
