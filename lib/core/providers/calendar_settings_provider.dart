import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Primary calendar display mode.
enum CalendarDisplayMode {
  /// Show Ethiopian calendar as primary, Gregorian as secondary.
  ethiopian,

  /// Show Gregorian calendar as primary, Ethiopian as secondary.
  gregorian,

  /// Show both calendars side by side.
  dual,
}

/// Week start day preference.
enum WeekStartDay {
  /// Saturday (Ethiopian default).
  saturday,

  /// Sunday (Western default).
  sunday,

  /// Monday (ISO default).
  monday,
}

/// Numeral display preference.
enum NumeralPreference {
  /// Ge'ez numerals (፩፪፫...).
  gez,

  /// Latin/Arabic numerals (1, 2, 3...).
  latin,
}

class CalendarSettings {
  const CalendarSettings({
    this.displayMode = CalendarDisplayMode.ethiopian,
    this.weekStart = WeekStartDay.saturday,
    this.numeralPreference = NumeralPreference.gez,
    this.timezone = 'Africa/Addis_Ababa',
  });

  final CalendarDisplayMode displayMode;
  final WeekStartDay weekStart;
  final NumeralPreference numeralPreference;
  final String timezone;

  CalendarSettings copyWith({
    CalendarDisplayMode? displayMode,
    WeekStartDay? weekStart,
    NumeralPreference? numeralPreference,
    String? timezone,
  }) {
    return CalendarSettings(
      displayMode: displayMode ?? this.displayMode,
      weekStart: weekStart ?? this.weekStart,
      numeralPreference: numeralPreference ?? this.numeralPreference,
      timezone: timezone ?? this.timezone,
    );
  }

  /// Returns the DateTime.weekday value (1=Monday..7=Sunday) for the
  /// configured week start.
  int get weekStartDay {
    switch (weekStart) {
      case WeekStartDay.saturday:
        return 6;
      case WeekStartDay.sunday:
        return 7;
      case WeekStartDay.monday:
        return 1;
    }
  }
}

class CalendarSettingsNotifier extends Notifier<CalendarSettings> {
  static const _kDisplayModeKey = 'calendar_display_mode';
  static const _kWeekStartKey = 'calendar_week_start';
  static const _kNumeralKey = 'calendar_numeral';
  static const _kTimezoneKey = 'calendar_timezone';

  @override
  CalendarSettings build() {
    _loadSettings();
    return const CalendarSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final displayIndex = prefs.getInt(_kDisplayModeKey);
    final weekStartIndex = prefs.getInt(_kWeekStartKey);
    final numeralIndex = prefs.getInt(_kNumeralKey);
    final timezone = prefs.getString(_kTimezoneKey);

    state = CalendarSettings(
      displayMode:
          displayIndex != null &&
              displayIndex < CalendarDisplayMode.values.length
          ? CalendarDisplayMode.values[displayIndex]
          : CalendarDisplayMode.ethiopian,
      weekStart:
          weekStartIndex != null && weekStartIndex < WeekStartDay.values.length
          ? WeekStartDay.values[weekStartIndex]
          : WeekStartDay.saturday,
      numeralPreference:
          numeralIndex != null && numeralIndex < NumeralPreference.values.length
          ? NumeralPreference.values[numeralIndex]
          : NumeralPreference.gez,
      timezone: timezone ?? 'Africa/Addis_Ababa',
    );
  }

  Future<void> setDisplayMode(CalendarDisplayMode mode) async {
    state = state.copyWith(displayMode: mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kDisplayModeKey, mode.index);
  }

  Future<void> setWeekStart(WeekStartDay day) async {
    state = state.copyWith(weekStart: day);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kWeekStartKey, day.index);
  }

  Future<void> setNumeralPreference(NumeralPreference pref) async {
    state = state.copyWith(numeralPreference: pref);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kNumeralKey, pref.index);
  }

  Future<void> setTimezone(String tz) async {
    state = state.copyWith(timezone: tz);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kTimezoneKey, tz);
  }
}

final calendarSettingsProvider =
    NotifierProvider<CalendarSettingsNotifier, CalendarSettings>(
      CalendarSettingsNotifier.new,
    );
