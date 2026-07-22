import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/offline_banner.dart';
import '../providers/today_view_state.dart';
import '../widgets/today_header.dart';
import '../widgets/up_next_card.dart';
import '../widgets/schedule_timeline.dart';
import '../widgets/today_reminders.dart';
import '../widgets/today_empty_state.dart';
import '../widgets/quick_add_sheet.dart';
import '../../../../core/theme/app_spacing.dart';

// Temporary fake data provider for static build-out
final fakeTodayProvider = Provider<TodayViewState>((ref) {
  return TodayViewState(
    ecDateLabel: 'Tir 15, 2017',
    gcDateLabel: 'Tuesday, July 22',
    upNextItem: const UpNextItem(
      time: '2:30 PM',
      title: 'Project Review Sync',
      subtitle: 'Discuss Q3 roadmap with team',
      type: 'Meeting',
    ),
    scheduleItems: [
      const ScheduleItem(
        time: '9:00 AM',
        title: 'Morning standup',
        subtitle: 'Daily team sync',
        status: ScheduleStatus.done,
      ),
      const ScheduleItem(
        time: '11:30 AM',
        title: 'Design review',
        subtitle: 'Review new mockups',
        status: ScheduleStatus.done,
      ),
      const ScheduleItem(
        time: '2:30 PM',
        title: 'Project Review Sync',
        subtitle: 'Discuss Q3 roadmap',
        status: ScheduleStatus.current,
      ),
      const ScheduleItem(
        time: '4:00 PM',
        title: 'Code review',
        subtitle: 'PR #234 review',
        status: ScheduleStatus.upcoming,
      ),
    ],
    reminderItems: [
      const ReminderItem(
        title: 'Call dentist',
        subtitle: 'Confirm appointment',
        time: '3:00 PM',
      ),
      const ReminderItem(
        title: 'Buy groceries',
        subtitle: 'Milk, eggs, bread',
        badgeLabel: 'Holiday',
        badgeStatus: true,
      ),
      const ReminderItem(
        title: 'Submit timesheet',
        time: '5:00 PM',
      ),
    ],
    isEmpty: false,
    syncStatus: SyncStatus.synced,
  );
});

class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fakeTodayProvider);

    return Scaffold(
      body: state.isEmpty
          ? TodayEmptyState(
              onAdd: () => QuickAddSheet.show(context),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodayHeader(
                    ecDateLabel: state.ecDateLabel,
                    gcDateLabel: state.gcDateLabel,
                  ),
                  OfflineBanner(status: state.syncStatus),
                  const SizedBox(height: AppSpacing.lg),
                  if (state.upNextItem != null) ...[
                    UpNextCard(item: state.upNextItem!),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (state.scheduleItems.isNotEmpty) ...[
                    ScheduleTimeline(items: state.scheduleItems),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (state.reminderItems.isNotEmpty) ...[
                    TodayReminders(items: state.reminderItems),
                    const SizedBox(height: AppSpacing.xxl),
                  ],
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => QuickAddSheet.show(context),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
