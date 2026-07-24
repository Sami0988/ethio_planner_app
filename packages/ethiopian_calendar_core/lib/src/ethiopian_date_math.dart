import 'ethiopian_date.dart';
import 'calendar_conversion.dart';
import 'gregorian_date.dart';

/// Utility functions for Ethiopian calendar date arithmetic.
abstract final class EthiopianDateMath {
  /// Adds [days] to an Ethiopian date, returning a new [EthiopianDate].
  static EthiopianDate addDays(EthiopianDate date, int days) {
    // Convert to GC, add days, convert back
    final gc = CalendarConversion.ethiopianToGregorian(date);
    final resultGc = GregorianDate(gc.year, gc.month, gc.day + days);
    return CalendarConversion.gregorianToEthiopian(resultGc);
  }

  /// Adds [months] to an Ethiopian date, returning a new [EthiopianDate].
  /// Preserves the day if valid; clamps to month end otherwise (P-13 skip-to-next).
  static EthiopianDate addMonths(EthiopianDate date, int months) {
    var newMonth = date.month + months;
    var newYear = date.year;

    while (newMonth > 13) {
      newMonth -= 13;
      newYear++;
    }
    while (newMonth < 1) {
      newMonth += 13;
      newYear--;
    }

    final maxDay = EthiopianDate.daysInMonthOf(newYear, newMonth);
    final newDay = date.day > maxDay ? maxDay : date.day;
    return EthiopianDate(newYear, newMonth, newDay);
  }

  /// Adds [years] to an Ethiopian date, returning a new [EthiopianDate].
  /// Preserves the day if valid; clamps to month end otherwise (P-13 skip-to-next).
  static EthiopianDate addYears(EthiopianDate date, int years) {
    final newYear = date.year + years;
    final maxDay = EthiopianDate.daysInMonthOf(newYear, date.month);
    final newDay = date.day > maxDay ? maxDay : date.day;
    return EthiopianDate(newYear, date.month, newDay);
  }

  /// Returns the day-of-week for an Ethiopian date.
  /// 0=Saturday, 1=Sunday, 2=Monday, ..., 6=Friday (Ethiopian week starts Saturday).
  static int dayOfWeek(EthiopianDate date) {
    final gc = CalendarConversion.ethiopianToGregorian(date);
    // DateTime.weekday: 1=Monday, 2=Tuesday, ..., 7=Sunday
    final gcWeekday = DateTime(gc.year, gc.month, gc.day).weekday;
    // Convert to Saturday=0 basis: Sat=0, Sun=1, Mon=2, ..., Fri=6
    return (gcWeekday + 1) % 7;
  }

  /// Returns the number of days in an Ethiopian month.
  static int daysInMonth(EthiopianDate date) =>
      EthiopianDate.daysInMonthOf(date.year, date.month);
}
