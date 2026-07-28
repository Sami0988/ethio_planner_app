// ignore_for_file: avoid_print

/// Database query performance benchmarks.
/// Measures Drift query patterns and data processing performance.
void main() {
  print('=== Database Query Performance Benchmarks ===\n');

  _benchmarkListFiltering();
  _benchmarkDateRangeFiltering();
  _benchmarkSorting();
  _benchmarkRecurrenceExpansion();
  _benchmarkSearchFiltering();
}

void _benchmarkListFiltering() {
  print('--- List Filtering (500 items) ---');

  // Simulate 500 calendar events
  final events = List.generate(500, (i) => {
    'id': i,
    'title': 'Event $i',
    'startUtc': DateTime.now().add(Duration(hours: i)),
    'isDeleted': i % 10 == 0,
  });

  final stopwatch = Stopwatch()..start();
  final active = events.where((e) => e['isDeleted'] == false).toList();
  stopwatch.stop();

  print('Filter deleted events: ${stopwatch.elapsedMicroseconds}µs (${active.length} results)');
}

void _benchmarkDateRangeFiltering() {
  print('\n--- Date Range Filtering (500 items) ---');

  final now = DateTime.now();
  final events = List.generate(500, (i) => {
    'id': i,
    'startUtc': now.add(Duration(days: i - 250)),
  });

  final weekStart = now.subtract(const Duration(days: 3));
  final weekEnd = now.add(const Duration(days: 4));

  final stopwatch = Stopwatch()..start();
  final inRange = events.where((e) {
    final date = e['startUtc'] as DateTime;
    return date.isAfter(weekStart) && date.isBefore(weekEnd);
  }).toList();
  stopwatch.stop();

  print('Date range filter (7 days): ${stopwatch.elapsedMicroseconds}µs (${inRange.length} results)');
}

void _benchmarkSorting() {
  print('\n--- Sorting (500 items) ---');

  final events = List.generate(500, (i) => {
    'id': i,
    'startUtc': DateTime.now().add(Duration(hours: 500 - i)),
  });

  final stopwatch = Stopwatch()..start();
  events.sort((a, b) =>
    (a['startUtc'] as DateTime).compareTo(b['startUtc'] as DateTime));
  stopwatch.stop();

  print('Sort by date: ${stopwatch.elapsedMicroseconds}µs');
}

void _benchmarkRecurrenceExpansion() {
  print('\n--- Recurrence Expansion (10 series, 52 weeks each) ---');

  final stopwatch = Stopwatch()..start();

  // Simulate expanding 10 recurring events over 52 weeks
  var count = 0;
  for (var series = 0; series < 10; series++) {
    final startDate = DateTime.now().subtract(const Duration(days: 365));
    for (var week = 0; week < 52; week++) {
      final occurrence = startDate.add(Duration(days: week * 7 + series));
      if (occurrence.isBefore(DateTime.now())) {
        count++;
      }
    }
  }

  stopwatch.stop();

  print('Expand 10 series × 52 weeks: ${stopwatch.elapsedMicroseconds}µs ($count occurrences)');
}

void _benchmarkSearchFiltering() {
  print('\n--- Search Filtering (1000 items) ---');

  final items = List.generate(1000, (i) => {
    'id': i,
    'title': 'Item $i - ${i % 5 == 0 ? "meeting" : "task"} ${i % 3 == 0 ? "urgent" : "normal"}',
    'type': ['event', 'reminder', 'planner', 'note'][i % 4],
  });

  final query = 'meeting';

  final stopwatch = Stopwatch()..start();
  final results = items.where((item) =>
    (item['title'] as String).toLowerCase().contains(query.toLowerCase())
  ).toList();
  stopwatch.stop();

  print('Search "$query": ${stopwatch.elapsedMicroseconds}µs (${results.length} results)');

  // Multi-type filter
  final stopwatch2 = Stopwatch()..start();
  final filtered = items.where((item) {
    final title = item['title'] as String;
    final type = item['type'] as String;
    return title.toLowerCase().contains(query.toLowerCase()) &&
        (type == 'event' || type == 'reminder');
  }).toList();
  stopwatch2.stop();

  print('Search + type filter: ${stopwatch2.elapsedMicroseconds}µs (${filtered.length} results)');
}
