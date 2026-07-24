import 'package:clock/clock.dart';
import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/sync/sync_status.dart';
import '../providers/today_view_state.dart';

/// Assembles the [TodayViewState].
///
/// The Ethiopian date is computed for real from the current date via
/// `ethiopian_calendar_core` and `clock` (testable time). Event and reminder
/// repositories arrive in Phase 1B; until then this controller supplies sample
/// content — a clearly-labelled UI build-out — so the screen and its tests can
/// exist. Replace [_withSampleContent] with repository stream composition when
/// the data layer lands.
final class TodayController extends Notifier<TodayViewState> {
  @override
  TodayViewState build() {
    final today = GregorianDate.fromDateTime(clock.now());
    final ethiopian = CalendarConversion.gregorianToEthiopian(today);
    return _withSampleContent(ethiopian, today);
  }

  void toggleReminder(String id) {
    state = state.copyWith(
      reminders: [
        for (final reminder in state.reminders)
          if (reminder.id == id)
            reminder.copyWith(isCompleted: !reminder.isCompleted)
          else
            reminder,
      ],
    );
  }

  Future<void> refresh() async {
    final today = GregorianDate.fromDateTime(clock.now());
    final ethiopian = CalendarConversion.gregorianToEthiopian(today);
    state = _withSampleContent(ethiopian, today);
  }

  TodayViewState _withSampleContent(EthiopianDate ec, GregorianDate gc) {
    return TodayViewState(
      ethiopianDate: ec,
      gregorianDate: gc,
      holiday: null,
      upNext: const UpNextPresentation(
        title: 'Product Review Meeting',
        time: '10:30 AM',
        timeEnd: '11:30 AM',
        subtitle: 'Discussing the new offline capabilities.',
        syncStatus: SyncStatus.savedLocally,
      ),
      events: const [
        EventPresentation(
          title: 'Doctor Appointment',
          time: '2:00 PM',
          location: 'Downtown Clinic',
        ),
        EventPresentation(title: 'Pick up groceries', time: '4:30 PM'),
      ],
      reminders: const [
        ReminderPresentation(id: 'r1', title: 'Call Mom'),
        ReminderPresentation(
          id: 'r2',
          title: 'Pay electricity bill',
          subtitle: 'Scheduled for yesterday',
          isOverdue: true,
        ),
      ],
      schedule: const [
        SchedulePresentation(
          time: '08:00 AM',
          title: 'Morning Reflection',
          subtitle: 'Completed',
          isCompleted: true,
        ),
        SchedulePresentation(
          time: '10:30 AM',
          title: 'Product Review Meeting',
          subtitle: 'Video Call',
        ),
        SchedulePresentation(time: '01:00 PM', title: 'Lunch with Team'),
      ],
      sync: const SyncPresentation(),
    );
  }
}

final todayControllerProvider =
    NotifierProvider<TodayController, TodayViewState>(TodayController.new);
