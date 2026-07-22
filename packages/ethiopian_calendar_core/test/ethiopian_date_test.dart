import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';
import 'package:test/test.dart';

void main() {
  group('EthiopianDate validation', () {
    test('accepts a normal date', () {
      expect(() => EthiopianDate(2016, 5, 30), returnsNormally);
    });

    test('rejects month 0 and 14', () {
      expect(() => EthiopianDate(2016, 0, 1), throwsArgumentError);
      expect(() => EthiopianDate(2016, 14, 1), throwsArgumentError);
    });

    test('rejects a 31st day in a 30-day month', () {
      expect(() => EthiopianDate(2016, 1, 31), throwsArgumentError);
    });

    test('Pagume has 5 days in a common year', () {
      expect(EthiopianDate.isLeapYear(2016), isFalse);
      expect(() => EthiopianDate(2016, 13, 5), returnsNormally);
      expect(() => EthiopianDate(2016, 13, 6), throwsArgumentError);
    });

    test('Pagume has 6 days in a leap year (year % 4 == 3)', () {
      expect(EthiopianDate.isLeapYear(2015), isTrue);
      expect(() => EthiopianDate(2015, 13, 6), returnsNormally);
      expect(() => EthiopianDate(2015, 13, 7), throwsArgumentError);
    });
  });

  group('GregorianDate validation', () {
    test('Feb 29 only in leap years', () {
      expect(() => GregorianDate(2024, 2, 29), returnsNormally);
      expect(() => GregorianDate(2023, 2, 29), throwsArgumentError);
      expect(GregorianDate.isLeapYear(1900), isFalse);
      expect(GregorianDate.isLeapYear(2000), isTrue);
    });
  });

  group('ordering', () {
    test('compareTo sorts chronologically', () {
      final dates = [
        EthiopianDate(2016, 1, 2),
        EthiopianDate(2015, 13, 6),
        EthiopianDate(2016, 1, 1),
      ]..sort();
      expect(dates.first, EthiopianDate(2015, 13, 6));
      expect(dates.last, EthiopianDate(2016, 1, 2));
    });
  });
}
