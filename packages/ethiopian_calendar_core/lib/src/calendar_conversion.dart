import 'ethiopian_date.dart';
import 'gregorian_date.dart';

/// Lossless conversion between the Ethiopian and Gregorian calendars.
///
/// The implementation uses the Rata Die (fixed day number) technique from
/// Dershowitz & Reingold, *Calendrical Calculations*. A date in either system
/// is mapped to an integer day count and back, which makes conversion exact
/// and round-trip stable for every supported date.
///
/// Verified anchors (definitional, real-world):
///   * Ethiopian New Year 2015 (Meskerem 1) = 11 September 2022 (common year).
///   * Ethiopian New Year 2016 (Meskerem 1) = 12 September 2023 (leap-adjacent).
abstract final class CalendarConversion {
  /// Rata Die of the Ethiopic epoch (Meskerem 1, year 1).
  static const int _ethiopicEpoch = 2796;

  static GregorianDate ethiopianToGregorian(EthiopianDate date) =>
      _gregorianFromFixed(_fixedFromEthiopic(date.year, date.month, date.day));

  static EthiopianDate gregorianToEthiopian(GregorianDate date) =>
      _ethiopicFromFixed(_fixedFromGregorian(date.year, date.month, date.day));

  // --- Ethiopic <-> fixed ---------------------------------------------------

  static int _fixedFromEthiopic(int year, int month, int day) =>
      _ethiopicEpoch -
      1 +
      365 * (year - 1) +
      (year ~/ 4) +
      30 * (month - 1) +
      day;

  static EthiopianDate _ethiopicFromFixed(int fixed) {
    final year = (4 * (fixed - _ethiopicEpoch) + 1463) ~/ 1461;
    final month = (fixed - _fixedFromEthiopic(year, 1, 1)) ~/ 30 + 1;
    final day = fixed - _fixedFromEthiopic(year, month, 1) + 1;
    return EthiopianDate(year, month, day);
  }

  // --- Gregorian <-> fixed --------------------------------------------------

  static int _fixedFromGregorian(int year, int month, int day) {
    final priorYear = year - 1;
    var correction = 0;
    if (month > 2) {
      correction = GregorianDate.isLeapYear(year) ? -1 : -2;
    }
    return 365 * priorYear +
        (priorYear ~/ 4) -
        (priorYear ~/ 100) +
        (priorYear ~/ 400) +
        ((367 * month - 362) ~/ 12) +
        correction +
        day;
  }

  static GregorianDate _gregorianFromFixed(int fixed) {
    final year = _gregorianYearFromFixed(fixed);
    final priorDays = fixed - _fixedFromGregorian(year, 1, 1);
    final correction = fixed < _fixedFromGregorian(year, 3, 1)
        ? 0
        : (GregorianDate.isLeapYear(year) ? 1 : 2);
    final month = (12 * (priorDays + correction) + 373) ~/ 367;
    final day = fixed - _fixedFromGregorian(year, month, 1) + 1;
    return GregorianDate(year, month, day);
  }

  static int _gregorianYearFromFixed(int fixed) {
    final d0 = fixed - 1;
    final n400 = d0 ~/ 146097;
    final d1 = d0 % 146097;
    final n100 = d1 ~/ 36524;
    final d2 = d1 % 36524;
    final n4 = d2 ~/ 1461;
    final d3 = d2 % 1461;
    final n1 = d3 ~/ 365;
    final year = 400 * n400 + 100 * n100 + 4 * n4 + n1;
    return (n100 == 4 || n1 == 4) ? year : year + 1;
  }
}
