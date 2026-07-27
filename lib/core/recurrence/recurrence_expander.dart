import '../database/app_database.dart';
import 'recurrence_engine.dart';
import 'recurrence_rule.dart';

/// A single occurrence of a recurring entity on a specific date.
class RecurrenceOccurrence<T> {
  const RecurrenceOccurrence({
    required this.entity,
    required this.occurrenceDate,
    required this.isOriginal,
  });

  final T entity;
  final DateTime occurrenceDate;
  final bool isOriginal;
}

/// Expands recurring events and reminders into concrete occurrences within a
/// date range. Handles exception dates (skipped/modified occurrences).
abstract final class RecurrenceExpander {
  /// Expands recurring events into occurrences within [rangeStart]..[rangeEnd].
  ///
  /// Non-recurring events that fall within the range are included as-is.
  /// Recurring events are expanded into individual occurrences.
  /// Skipped exceptions are excluded. Modified exceptions return the original
  /// entity with the occurrence date set to the exception date.
  static List<RecurrenceOccurrence<CalendarEvent>> expandEvents({
    required List<CalendarEvent> events,
    required DateTime rangeStart,
    required DateTime rangeEnd,
    Set<String> skippedOccurrences = const {},
    Map<String, DateTime> modifiedOccurrences = const {},
  }) {
    final results = <RecurrenceOccurrence<CalendarEvent>>[];

    for (final event in events) {
      if (event.recurrenceRule == null) {
        // Non-recurring: include if in range
        if (!event.gcDate.isBefore(rangeStart) &&
            event.gcDate.isBefore(rangeEnd)) {
          results.add(
            RecurrenceOccurrence(
              entity: event,
              occurrenceDate: event.gcDate,
              isOriginal: true,
            ),
          );
        }
        continue;
      }

      // Recurring: expand
      final rule = RecurrenceRule.fromJson(event.recurrenceRule!);
      final occurrences = RecurrenceEngine.generate(
        rule: rule,
        startDate: event.gcDate,
        rangeStart: rangeStart,
        rangeEnd: rangeEnd,
      );

      for (final occurrenceDate in occurrences) {
        final exceptionKey =
            '${event.id}_${occurrenceDate.millisecondsSinceEpoch}';

        // Skip if this occurrence was skipped
        if (skippedOccurrences.contains(exceptionKey)) continue;

        // Check if this occurrence was modified
        final modifiedDate = modifiedOccurrences[exceptionKey];
        final effectiveDate = modifiedDate ?? occurrenceDate;

        results.add(
          RecurrenceOccurrence(
            entity: event,
            occurrenceDate: effectiveDate,
            isOriginal: effectiveDate == occurrenceDate,
          ),
        );
      }
    }

    // Sort by occurrence date
    results.sort((a, b) => a.occurrenceDate.compareTo(b.occurrenceDate));
    return results;
  }

  /// Expands recurring reminders into occurrences within [rangeStart]..[rangeEnd].
  static List<RecurrenceOccurrence<Reminder>> expandReminders({
    required List<Reminder> reminders,
    required DateTime rangeStart,
    required DateTime rangeEnd,
    Set<String> skippedOccurrences = const {},
    Map<String, DateTime> modifiedOccurrences = const {},
  }) {
    final results = <RecurrenceOccurrence<Reminder>>[];

    for (final reminder in reminders) {
      if (reminder.recurrenceRule == null) {
        // Non-recurring: include if in range
        if (!reminder.gcDate.isBefore(rangeStart) &&
            reminder.gcDate.isBefore(rangeEnd)) {
          results.add(
            RecurrenceOccurrence(
              entity: reminder,
              occurrenceDate: reminder.gcDate,
              isOriginal: true,
            ),
          );
        }
        continue;
      }

      // Recurring: expand
      final rule = RecurrenceRule.fromJson(reminder.recurrenceRule!);
      final occurrences = RecurrenceEngine.generate(
        rule: rule,
        startDate: reminder.gcDate,
        rangeStart: rangeStart,
        rangeEnd: rangeEnd,
      );

      for (final occurrenceDate in occurrences) {
        final exceptionKey =
            '${reminder.id}_${occurrenceDate.millisecondsSinceEpoch}';

        // Skip if this occurrence was skipped
        if (skippedOccurrences.contains(exceptionKey)) continue;

        // Check if this occurrence was modified
        final modifiedDate = modifiedOccurrences[exceptionKey];
        final effectiveDate = modifiedDate ?? occurrenceDate;

        results.add(
          RecurrenceOccurrence(
            entity: reminder,
            occurrenceDate: effectiveDate,
            isOriginal: effectiveDate == occurrenceDate,
          ),
        );
      }
    }

    // Sort by occurrence date
    results.sort((a, b) => a.occurrenceDate.compareTo(b.occurrenceDate));
    return results;
  }

  /// Returns all occurrence dates for a recurring entity within a range.
  /// Useful for calendar dot indicators.
  static List<DateTime> getOccurrenceDates({
    required RecurrenceRule rule,
    required DateTime startDate,
    required DateTime rangeStart,
    required DateTime rangeEnd,
    Set<String> skippedOccurrences = const {},
  }) {
    final occurrences = RecurrenceEngine.generate(
      rule: rule,
      startDate: startDate,
      rangeStart: rangeStart,
      rangeEnd: rangeEnd,
    );

    return occurrences.where((date) {
      final key =
          '${startDate.millisecondsSinceEpoch}_${date.millisecondsSinceEpoch}';
      return !skippedOccurrences.contains(key);
    }).toList();
  }
}
