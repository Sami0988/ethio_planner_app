import 'package:ethiopian_calendar_core/ethiopian_calendar_core.dart';

import 'recurrence_rule.dart';

/// Generates concrete dates from a [RecurrenceRule].
///
/// Bounded by [maxOccurrences] (default 365, per Sprint 0 P-14: 3 years / 365 max)
/// and [dateRange] if provided.
abstract final class RecurrenceEngine {
  static const int maxOccurrences = 365;

  /// Generates all occurrences of [rule] starting from [startDate] within the
  /// given [dateRange] (inclusive start, exclusive end).
  ///
  /// Returns a list of DateTime objects representing each occurrence.
  static List<DateTime> generate({
    required RecurrenceRule rule,
    required DateTime startDate,
    DateTime? rangeStart,
    DateTime? rangeEnd,
    int? limit,
  }) {
    final effectiveLimit = (limit ?? maxOccurrences).clamp(1, maxOccurrences);
    final results = <DateTime>[];
    var current = startDate;
    var count = 0;

    while (count < effectiveLimit) {
      if (rule.until != null && current.isAfter(rule.until!)) break;
      if (rangeEnd != null && current.isAfter(rangeEnd)) break;

      final inRange = rangeStart == null || !current.isBefore(rangeStart);
      if (inRange) {
        results.add(current);
      }

      count++;
      if (count >= effectiveLimit) break;

      current = _nextOccurrence(rule, current);
    }

    return results;
  }

  /// Checks whether [date] falls on an occurrence of [rule] starting from [startDate].
  static bool isOccurrence({
    required RecurrenceRule rule,
    required DateTime startDate,
    required DateTime date,
  }) {
    if (date.isBefore(startDate)) return false;
    if (rule.until != null && date.isAfter(rule.until!)) return false;

    final occurrences = generate(
      rule: rule,
      startDate: startDate,
      rangeStart: date,
      rangeEnd: date.add(const Duration(days: 1)),
      limit: 1,
    );
    return occurrences.isNotEmpty;
  }

  /// Returns the next occurrence after [current] for the given [rule].
  static DateTime _nextOccurrence(RecurrenceRule rule, DateTime current) {
    switch (rule.frequency) {
      case RecurrenceFrequency.daily:
        return current.add(Duration(days: rule.interval));

      case RecurrenceFrequency.weekly:
        return current.add(Duration(days: 7 * rule.interval));

      case RecurrenceFrequency.monthly:
        if (rule.basis == RecurrenceBasis.ethiopian) {
          return _addEthiopianMonths(current, rule.interval);
        }
        return _addGregorianMonths(current, rule.interval);

      case RecurrenceFrequency.yearly:
        if (rule.basis == RecurrenceBasis.ethiopian) {
          return _addEthiopianYears(current, rule.interval);
        }
        return _addGregorianYears(current, rule.interval);
    }
  }

  static DateTime _addEthiopianMonths(DateTime date, int months) {
    final ec = CalendarConversion.gregorianToEthiopian(
      GregorianDate(date.year, date.month, date.day),
    );
    final newEc = EthiopianDateMath.addMonths(ec, months);
    final newGc = CalendarConversion.ethiopianToGregorian(newEc);
    return DateTime(newGc.year, newGc.month, newGc.day);
  }

  static DateTime _addEthiopianYears(DateTime date, int years) {
    final ec = CalendarConversion.gregorianToEthiopian(
      GregorianDate(date.year, date.month, date.day),
    );
    final newEc = EthiopianDateMath.addYears(ec, years);
    final newGc = CalendarConversion.ethiopianToGregorian(newEc);
    return DateTime(newGc.year, newGc.month, newGc.day);
  }

  static DateTime _addGregorianMonths(DateTime date, int months) {
    var newMonth = date.month + months;
    var newYear = date.year;
    while (newMonth > 12) {
      newMonth -= 12;
      newYear++;
    }
    while (newMonth < 1) {
      newMonth += 12;
      newYear--;
    }
    final maxDay = GregorianDate.daysInMonthOf(newYear, newMonth);
    final newDay = date.day > maxDay ? maxDay : date.day;
    return DateTime(newYear, newMonth, newDay);
  }

  static DateTime _addGregorianYears(DateTime date, int years) {
    final newYear = date.year + years;
    final maxDay = GregorianDate.daysInMonthOf(newYear, date.month);
    final newDay = date.day > maxDay ? maxDay : date.day;
    return DateTime(newYear, date.month, newDay);
  }

  /// Returns a human-readable description of the recurrence rule.
  static String describe(RecurrenceRule rule) {
    final basis = rule.basis == RecurrenceBasis.ethiopian
        ? 'Ethiopian'
        : 'Gregorian';

    switch (rule.frequency) {
      case RecurrenceFrequency.daily:
        return rule.interval == 1 ? 'Daily' : 'Every ${rule.interval} days';
      case RecurrenceFrequency.weekly:
        return rule.interval == 1 ? 'Weekly' : 'Every ${rule.interval} weeks';
      case RecurrenceFrequency.monthly:
        return rule.interval == 1
            ? 'Monthly ($basis)'
            : 'Every ${rule.interval} months ($basis)';
      case RecurrenceFrequency.yearly:
        return rule.interval == 1
            ? 'Yearly ($basis)'
            : 'Every ${rule.interval} years ($basis)';
    }
  }
}
