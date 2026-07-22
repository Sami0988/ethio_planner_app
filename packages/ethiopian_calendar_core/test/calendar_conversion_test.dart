import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:test/test.dart';

void main() {
  group('golden reference anchors', () {
    // (ethYear, ethMonth, ethDay, gregYear, gregMonth, gregDay)
    const anchors = <List<int>>[
      // Ethiopic epoch: Meskerem 1, year 1.
      [1, 1, 1, 8, 8, 27],
      // Ethiopian New Year (common year) -> 11 September.
      [2015, 1, 1, 2022, 9, 11],
      // Ethiopian New Year (leap-adjacent year) -> 12 September.
      [2016, 1, 1, 2023, 9, 12],
      // Pagume 6 in a leap year (2015 % 4 == 3).
      [2015, 13, 6, 2023, 9, 11],
      // Pagume 5 in a common year.
      [2014, 13, 5, 2022, 9, 10],
    ];

    for (final a in anchors) {
      final eth = EthiopianDate(a[0], a[1], a[2]);
      final greg = GregorianDate(a[3], a[4], a[5]);
      test('$eth <-> $greg', () {
        expect(CalendarConversion.ethiopianToGregorian(eth), greg);
        expect(CalendarConversion.gregorianToEthiopian(greg), eth);
      });
    }
  });

  test('Ethiopian New Year falls on 11 or 12 September', () {
    for (var year = 1950; year <= 2100; year++) {
      final greg =
          CalendarConversion.ethiopianToGregorian(EthiopianDate(year, 1, 1));
      expect(greg.month, 9, reason: 'year $year');
      expect(greg.day, anyOf(11, 12), reason: 'year $year');
    }
  });

  test('round trips for every day across a wide range', () {
    var eth = EthiopianDate(1900, 1, 1);
    final end = EthiopianDate(2100, 1, 1);
    while (eth.compareTo(end) < 0) {
      final greg = CalendarConversion.ethiopianToGregorian(eth);
      expect(CalendarConversion.gregorianToEthiopian(greg), eth);
      eth = _nextEthiopianDay(eth);
    }
  });
}

EthiopianDate _nextEthiopianDay(EthiopianDate d) {
  final maxDay = EthiopianDate.daysInMonthOf(d.year, d.month);
  if (d.day < maxDay) return EthiopianDate(d.year, d.month, d.day + 1);
  if (d.month < 13) return EthiopianDate(d.year, d.month + 1, 1);
  return EthiopianDate(d.year + 1, 1, 1);
}
