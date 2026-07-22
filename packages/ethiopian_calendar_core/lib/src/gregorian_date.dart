import 'calendar_basis.dart';

/// An immutable, timezone-independent Gregorian calendar date (no time part).
///
/// Date-only values must never shift because of timezone conversion
/// (BR-CAL-002 / CAL-FR-008), which is why this type stores plain integers
/// rather than a [DateTime].
final class GregorianDate implements Comparable<GregorianDate> {
  const GregorianDate._(this.year, this.month, this.day);

  /// Creates a validated Gregorian date.
  ///
  /// Throws [ArgumentError] if the components do not form a real date.
  factory GregorianDate(int year, int month, int day) {
    if (year < 1) {
      throw ArgumentError.value(year, 'year', 'Year must be >= 1');
    }
    if (month < 1 || month > 12) {
      throw ArgumentError.value(month, 'month', 'Month must be 1..12');
    }
    final maxDay = daysInMonthOf(year, month);
    if (day < 1 || day > maxDay) {
      throw ArgumentError.value(day, 'day', 'Day must be 1..$maxDay');
    }
    return GregorianDate._(year, month, day);
  }

  /// Builds a [GregorianDate] from the calendar-date part of a [DateTime],
  /// ignoring its time and timezone.
  factory GregorianDate.fromDateTime(DateTime dateTime) =>
      GregorianDate(dateTime.year, dateTime.month, dateTime.day);

  final int year;
  final int month;
  final int day;

  CalendarBasis get basis => CalendarBasis.gregorian;

  static bool isLeapYear(int year) =>
      year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

  bool get isInLeapYear => isLeapYear(year);

  static int daysInMonthOf(int year, int month) {
    const lengths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (month == 2 && isLeapYear(year)) return 29;
    return lengths[month - 1];
  }

  /// Returns this date as a UTC [DateTime] at midnight. UTC is used so that no
  /// local timezone can move the calendar day.
  DateTime toUtcDateTime() => DateTime.utc(year, month, day);

  @override
  int compareTo(GregorianDate other) {
    if (year != other.year) return year.compareTo(other.year);
    if (month != other.month) return month.compareTo(other.month);
    return day.compareTo(other.day);
  }

  @override
  bool operator ==(Object other) =>
      other is GregorianDate &&
      other.year == year &&
      other.month == month &&
      other.day == day;

  @override
  int get hashCode => Object.hash(year, month, day);

  @override
  String toString() =>
      'GregorianDate(${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')})';
}
