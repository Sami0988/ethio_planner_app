import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';

/// Formats already-computed calendar dates into localized labels.
///
/// This is pure presentation: the Ethiopian conversion itself happens in the
/// controller (via `ethiopian_calendar_core`), never here. Gregorian month
/// names remain in English by design, matching the SRS dual-date examples
/// (e.g. "September 23, 2024 GC") in every interface language.
final class TodayDateFormatter {
  const TodayDateFormatter(this.localeCode);

  final String localeCode;

  bool get _isAmharic => localeCode.startsWith('am');

  static const _ecMonthsEn = <String>[
    'Meskerem',
    'Tikimt',
    'Hidar',
    'Tahsas',
    'Tir',
    'Yekatit',
    'Megabit',
    'Miazia',
    'Ginbot',
    'Sene',
    'Hamle',
    'Nehase',
    'Pagume',
  ];

  static const _ecMonthsAm = <String>[
    'መስከረም',
    'ጥቅምት',
    'ኅዳር',
    'ታኅሣሥ',
    'ጥር',
    'የካቲት',
    'መጋቢት',
    'ሚያዝያ',
    'ግንቦት',
    'ሰኔ',
    'ሐምሌ',
    'ነሐሴ',
    'ጳጉሜ',
  ];

  static const _weekdaysEn = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  static const _weekdaysAm = <String>[
    'ሰኞ',
    'ማክሰኞ',
    'ረቡዕ',
    'ሐሙስ',
    'ዓርብ',
    'ቅዳሜ',
    'እሁድ',
  ];

  static const _gcMonthsEn = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// e.g. "Meskerem 12, 2017" / "መስከረም 12፣ 2017".
  String ethiopianMonthDayYear(EthiopianDate date) {
    final month = (_isAmharic ? _ecMonthsAm : _ecMonthsEn)[date.month - 1];
    final comma = _isAmharic ? '፣' : ',';
    return '$month ${date.day}$comma ${date.year}';
  }

  /// e.g. "Tuesday" / "ማክሰኞ" (derived from the shared day count).
  String weekday(GregorianDate date) {
    final index = date.toUtcDateTime().weekday - 1; // Mon=0 .. Sun=6
    return (_isAmharic ? _weekdaysAm : _weekdaysEn)[index];
  }

  /// e.g. "September 23, 2024" (always English month, per SRS examples).
  String gregorianMonthDayYear(GregorianDate date) =>
      '${_gcMonthsEn[date.month - 1]} ${date.day}, ${date.year}';
}
