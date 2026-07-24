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

  test('Ethiopian New Year falls on 11, 12, or 13 September', () {
    for (var year = 1950; year <= 2100; year++) {
      final greg = CalendarConversion.ethiopianToGregorian(
        EthiopianDate(year, 1, 1),
      );
      expect(greg.month, 9, reason: 'year $year');
      // Sep 11 = common year preceding, Sep 12 = leap-adjacent, Sep 13 = leap year preceding
      expect(greg.day, anyOf(11, 12, 13), reason: 'year $year');
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

  group('Sprint 0 reference vectors', () {
    test('C-01: Enkutatash (1 Meskerem 2016 = 12 Sep 2023)', () {
      final greg = CalendarConversion.ethiopianToGregorian(
        EthiopianDate(2016, 1, 1),
      );
      expect(greg, GregorianDate(2023, 9, 12));
      expect(
        CalendarConversion.gregorianToEthiopian(GregorianDate(2023, 9, 12)),
        EthiopianDate(2016, 1, 1),
      );
    });

    test('C-02: Genna (29 Tahsas 2016 = 8 Jan 2024)', () {
      final greg = CalendarConversion.ethiopianToGregorian(
        EthiopianDate(2016, 4, 29),
      );
      expect(greg, GregorianDate(2024, 1, 8));
      expect(
        CalendarConversion.gregorianToEthiopian(GregorianDate(2024, 1, 8)),
        EthiopianDate(2016, 4, 29),
      );
    });

    test('C-03: Timkat (11 Ter 2016 = 20 Jan 2024)', () {
      final greg = CalendarConversion.ethiopianToGregorian(
        EthiopianDate(2016, 5, 11),
      );
      expect(greg, GregorianDate(2024, 1, 20));
      expect(
        CalendarConversion.gregorianToEthiopian(GregorianDate(2024, 1, 20)),
        EthiopianDate(2016, 5, 11),
      );
    });

    test('C-04: Pagume 6 in year with 6 Pagume days (2015)', () {
      final greg = CalendarConversion.ethiopianToGregorian(
        EthiopianDate(2015, 13, 6),
      );
      expect(greg, GregorianDate(2023, 9, 11));
    });

    test('C-05: Pagume 5 in year with 5 Pagume days (2016)', () {
      final greg = CalendarConversion.ethiopianToGregorian(
        EthiopianDate(2016, 13, 5),
      );
      expect(greg, GregorianDate(2024, 9, 10));
    });

    test('C-06: Leap year GC 29 Feb 2024 = 21 Yekatit 2016', () {
      final ec = CalendarConversion.gregorianToEthiopian(
        GregorianDate(2024, 2, 29),
      );
      expect(ec, EthiopianDate(2016, 6, 21));
      expect(
        CalendarConversion.ethiopianToGregorian(EthiopianDate(2016, 6, 21)),
        GregorianDate(2024, 2, 29),
      );
    });

    test('C-07: EC New Year 1 Meskerem 2017 = 11 Sep 2024', () {
      final greg = CalendarConversion.ethiopianToGregorian(
        EthiopianDate(2017, 1, 1),
      );
      expect(greg, GregorianDate(2024, 9, 11));
    });

    test('C-09: Invalid EC dates are rejected', () {
      expect(() => EthiopianDate(2016, 13, 6), throwsArgumentError);
      expect(() => EthiopianDate(2016, 0, 1), throwsArgumentError);
    });
  });
}

EthiopianDate _nextEthiopianDay(EthiopianDate d) {
  final maxDay = EthiopianDate.daysInMonthOf(d.year, d.month);
  if (d.day < maxDay) return EthiopianDate(d.year, d.month, d.day + 1);
  if (d.month < 13) return EthiopianDate(d.year, d.month + 1, 1);
  return EthiopianDate(d.year + 1, 1, 1);
}
