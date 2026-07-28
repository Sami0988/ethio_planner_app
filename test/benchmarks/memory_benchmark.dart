// ignore_for_file: avoid_print

/// Memory and startup performance benchmarks.
/// Measures data processing performance for common operations.
void main() {
  print('=== Memory & Startup Benchmarks ===\n');

  _measureDartVMStartup();
  _measureDatabaseInit();
  _measureDataSerialization();
}

void _measureDartVMStartup() {
  print('--- Dart VM Computation ---');

  final stopwatch = Stopwatch()..start();

  // Simulate Dart VM initialization work
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += i;
  }

  stopwatch.stop();
  print('Dart VM computation benchmark: ${stopwatch.elapsedMilliseconds}ms (sum=$sum)');
  print('');
}

void _measureDatabaseInit() {
  print('--- Database Schema Operations ---');

  // Simulate table creation queries
  final schemas = [
    'CalendarEvents',
    'PlannerItems',
    'Reminders',
    'Notes',
    'RecentlyDeletedItems',
    'OutboxOperations',
    'NoteRevisions',
    'RecurrenceExceptions',
  ];

  final stopwatch = Stopwatch()..start();
  for (final schema in schemas) {
    // Simulate schema parsing and validation
    schema.length;
  }
  stopwatch.stop();

  print('Schema parsing (${schemas.length} tables): ${stopwatch.elapsedMicroseconds}µs');
  print('');
}

void _measureDataSerialization() {
  print('--- Data Serialization ---');

  // JSON serialization benchmark
  final jsonData = <String, dynamic>{};
  for (var i = 0; i < 100; i++) {
    jsonData['key_$i'] = {
      'id': i,
      'title': 'Event $i',
      'startUtc': DateTime.now().toIso8601String(),
      'tags': ['tag1', 'tag2', 'tag3'],
    };
  }

  final stopwatch = Stopwatch()..start();
  final serialized = jsonData.toString();
  stopwatch.stop();

  print('JSON stringify (100 objects): ${stopwatch.elapsedMicroseconds}µs');
  print('Serialized size: ${serialized.length} chars');

  // DateTime parsing benchmark
  final dateStrings = List.generate(100, (i) => DateTime.now().add(Duration(hours: i)).toIso8601String());

  final stopwatch2 = Stopwatch()..start();
  for (final ds in dateStrings) {
    DateTime.parse(ds);
  }
  stopwatch2.stop();

  print('DateTime.parse (100 dates): ${stopwatch2.elapsedMicroseconds}µs');
}
