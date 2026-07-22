import 'calendar_basis.dart';

/// An immutable Ethiopian calendar date (no time part).
///
/// The Ethiopian year has 13 months: twelve months of 30 days followed by
/// Pagume, which has 5 days in common years and 6 days in leap years
/// (CAL-FR-001). A year is a leap year when `year % 4 == 3`.
final class EthiopianDate implements Comparable<EthiopianDate> {
  const EthiopianDate._(this.year, this.month, this.day);

  /// Creates a validated Ethiopian date.
  ///
  /// Throws [ArgumentError] if the components do not form a real date,
  /// including invalid Pagume days (DATE-FR-003).
  factory EthiopianDate(int year, int month, int day) {
    if (year < 1) {
      throw ArgumentError.value(year, 'year', 'Year must be >= 1');
    }
    if (month < 1 || month > 13) {
      throw ArgumentError.value(month, 'month', 'Month must be 1..13');
    }
    final maxDay = daysInMonthOf(year, month);
    if (day < 1 || day > maxDay) {
      throw ArgumentError.value(
        day,
        'day',
        'Day must be 1..$maxDay for month $month',
      );
    }
    return EthiopianDate._(year, month, day);
  }

  final int year;
  final int month;
  final int day;

  CalendarBasis get basis => CalendarBasis.ethiopian;

  /// Ethiopian leap years occur when `year % 4 == 3`; Pagume then has 6 days.
  static bool isLeapYear(int year) => year % 4 == 3;

  bool get isInLeapYear => isLeapYear(year);

  /// Whether [month] is Pagume, the 13th month.
  bool get isPagume => month == 13;

  static int daysInMonthOf(int year, int month) {
    if (month == 13) return isLeapYear(year) ? 6 : 5;
    return 30;
  }

  @override
  int compareTo(EthiopianDate other) {
    if (year != other.year) return year.compareTo(other.year);
    if (month != other.month) return month.compareTo(other.month);
    return day.compareTo(other.day);
  }

  @override
  bool operator ==(Object other) =>
      other is EthiopianDate &&
      other.year == year &&
      other.month == month &&
      other.day == day;

  @override
  int get hashCode => Object.hash(year, month, day);

  @override
  String toString() =>
      'EthiopianDate(${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')})';
}
