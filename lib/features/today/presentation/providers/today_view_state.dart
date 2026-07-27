import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/sync/sync_status.dart';

part 'today_view_state.freezed.dart';

/// Prepared presentation model for the Today screen (TODAY-FR-*).
///
/// Holds already-computed calendar values (converted in the controller, never
/// in a widget) plus the day's content. Widgets only format and render.
@freezed
abstract class TodayViewState with _$TodayViewState {
  const factory TodayViewState({
    required EthiopianDate ethiopianDate,
    required GregorianDate gregorianDate,
    HolidayPresentation? holiday,
    UpNextPresentation? upNext,
    @Default(<EventPresentation>[]) List<EventPresentation> events,
    @Default(<ReminderPresentation>[]) List<ReminderPresentation> reminders,
    @Default(<SchedulePresentation>[]) List<SchedulePresentation> schedule,
    @Default(SyncPresentation()) SyncPresentation sync,
    @Default(0) int planningStreak,
    @Default(false) bool isPreviewingDay,
    DateTime? previewDate,
  }) = _TodayViewState;

  const TodayViewState._();

  bool get hasSchedule =>
      upNext != null ||
      events.isNotEmpty ||
      reminders.isNotEmpty ||
      schedule.isNotEmpty;
}

@freezed
abstract class HolidayPresentation with _$HolidayPresentation {
  const factory HolidayPresentation({
    required String name,
    required String type,
    @Default(false) bool isEstimated,
  }) = _HolidayPresentation;
}

@freezed
abstract class UpNextPresentation with _$UpNextPresentation {
  const factory UpNextPresentation({
    required String title,
    String? id,
    String? type,
    String? time,
    String? timeEnd,
    String? subtitle,
    String? location,
    @Default(false) bool isAllDay,
    @Default(false) bool isPending,
    @Default(SyncStatus.synced) SyncStatus syncStatus,
  }) = _UpNextPresentation;
}

@freezed
abstract class EventPresentation with _$EventPresentation {
  const factory EventPresentation({
    required String title,
    String? id,
    String? time,
    String? location,
    @Default(0) int colorIndex,
    @Default(false) bool isAllDay,
    @Default(false) bool isPending,
  }) = _EventPresentation;
}

@freezed
abstract class ReminderPresentation with _$ReminderPresentation {
  const factory ReminderPresentation({
    required String id,
    required String title,
    String? subtitle,
    String? time,
    @Default(false) bool isOverdue,
    @Default(false) bool isCompleted,
  }) = _ReminderPresentation;
}

@freezed
abstract class SchedulePresentation with _$SchedulePresentation {
  const factory SchedulePresentation({
    required String time,
    required String title,
    String? subtitle,
    @Default(0) int colorIndex,
    @Default(false) bool isCompleted,
  }) = _SchedulePresentation;
}

@freezed
abstract class SyncPresentation with _$SyncPresentation {
  const factory SyncPresentation({
    @Default(SyncStatus.synced) SyncStatus status,
    @Default(0) int pendingCount,
  }) = _SyncPresentation;
}
