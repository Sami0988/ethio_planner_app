import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_settings.freezed.dart';
part 'calendar_settings.g.dart';

/// Primary calendar display preference.
enum CalendarDisplayMode { ethiopian, gregorian, dual }

/// Week start day preference.
enum WeekStartDay { monday, sunday, saturday }

/// Calendar-related settings.
@freezed
abstract class CalendarSettings with _$CalendarSettings {
  const factory CalendarSettings({
    /// Primary calendar display mode.
    @Default(CalendarDisplayMode.dual) CalendarDisplayMode displayMode,

    /// Which day the week starts on.
    @Default(WeekStartDay.monday) WeekStartDay weekStartDay,

    /// Primary timezone (IANA format, e.g., 'Africa/Addis_Ababa').
    @Default('Africa/Addis_Ababa') String primaryTimezone,

    /// Optional home timezone for dual-timezone display.
    String? homeTimezone,

    /// Enabled content bundle IDs.
    @Default(['ethiopian_holidays', 'ethiopian_observances'])
    List<String> enabledContentBundles,

    /// Numeral preference (Ethiopian numerals vs Latin).
    @Default(false) bool useEthiopianNumerals,
  }) = _CalendarSettings;

  factory CalendarSettings.fromJson(Map<String, dynamic> json) =>
      _$CalendarSettingsFromJson(json);
}
