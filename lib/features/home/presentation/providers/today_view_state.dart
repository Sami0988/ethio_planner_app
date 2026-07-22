import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/widgets/offline_banner.dart';

part 'today_view_state.freezed.dart';

@freezed
abstract class TodayViewState with _$TodayViewState {
  const factory TodayViewState({
    required String ecDateLabel,
    required String gcDateLabel,
    UpNextItem? upNextItem,
    @Default([]) List<ScheduleItem> scheduleItems,
    @Default([]) List<ReminderItem> reminderItems,
    @Default(false) bool isEmpty,
    @Default(SyncStatus.synced) SyncStatus syncStatus,
  }) = _TodayViewState;
}

@freezed
abstract class UpNextItem with _$UpNextItem {
  const factory UpNextItem({
    required String time,
    required String title,
    required String subtitle,
    required String type,
  }) = _UpNextItem;
}

@freezed
abstract class ScheduleItem with _$ScheduleItem {
  const factory ScheduleItem({
    required String time,
    required String title,
    required String subtitle,
    required ScheduleStatus status,
  }) = _ScheduleItem;
}

enum ScheduleStatus { done, current, upcoming }

@freezed
abstract class ReminderItem with _$ReminderItem {
  const factory ReminderItem({
    required String title,
    String? subtitle,
    String? time,
    String? badgeLabel,
    bool? badgeStatus,
    @Default(false) bool isCompleted,
  }) = _ReminderItem;
}
