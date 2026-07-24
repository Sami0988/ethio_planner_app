import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../providers/reminders_providers.dart';
import '../providers/reminders_view_state.dart';

class ReminderFilterChips extends ConsumerWidget {
  const ReminderFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(remindersControllerProvider);
    final controller = ref.read(remindersControllerProvider.notifier);

    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        children: ReminderFilter.values.map((filter) {
          final isSelected = state.filter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: FilterChip(
              label: Text(_filterLabel(filter)),
              selected: isSelected,
              onSelected: (_) => controller.setFilter(filter),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _filterLabel(ReminderFilter filter) {
    switch (filter) {
      case ReminderFilter.all:
        return 'All';
      case ReminderFilter.today:
        return 'Today';
      case ReminderFilter.overdue:
        return 'Overdue';
      case ReminderFilter.upcoming:
        return 'Upcoming';
      case ReminderFilter.completed:
        return 'Completed';
    }
  }
}
