// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Widget rendering performance benchmarks.
void main() {
  group('Animation Benchmarks', () {
    testWidgets('AnimatedContainer transition', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return GestureDetector(
                  onTap: () => setState(() {}),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ),
      );

      final stopwatch = Stopwatch()..start();
      await tester.pump(const Duration(milliseconds: 150));
      await tester.pump(const Duration(milliseconds: 150));
      stopwatch.stop();

      final ms = stopwatch.elapsedMilliseconds;
      print('AnimatedContainer transition: ${ms}ms');
      expect(ms, lessThan(500), reason: 'Animation should complete in under 500ms');
    });
  });

  group('List Performance Benchmarks', () {
    testWidgets('ListView with 100 items', (tester) async {
      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                  subtitle: Text('Subtitle $index'),
                  trailing: const Icon(Icons.chevron_right),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      stopwatch.stop();
      final ms = stopwatch.elapsedMilliseconds;
      print('ListView (100 items) render: ${ms}ms');
      expect(ms, lessThan(2000), reason: 'List of 100 items should render in under 2 seconds');
    });

    testWidgets('ListView scroll performance', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ),
      );
      await tester.pump();

      final stopwatch = Stopwatch()..start();
      for (var i = 0; i < 10; i++) {
        await tester.drag(find.byType(ListView), const Offset(0, -200));
        await tester.pump();
      }
      stopwatch.stop();

      final ms = stopwatch.elapsedMilliseconds;
      print('ListView scroll (10 items): ${ms}ms');
      expect(ms, lessThan(1000), reason: 'Scrolling should be smooth');
    });

    testWidgets('Calendar grid month view', (tester) async {
      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: 42,
              itemBuilder: (context, index) {
                return Center(child: Text('${index + 1}'));
              },
            ),
          ),
        ),
      );
      await tester.pump();

      stopwatch.stop();
      final ms = stopwatch.elapsedMilliseconds;
      print('Calendar grid (42 cells) render: ${ms}ms');
      expect(ms, lessThan(1000), reason: 'Calendar grid should render in under 1 second');
    });
  });

  group('Widget Complexity Benchmarks', () {
    testWidgets('Nested Column with 50 Text widgets', (tester) async {
      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  50,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'This is a somewhat long text item number $index for benchmarking purposes',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      stopwatch.stop();
      final ms = stopwatch.elapsedMilliseconds;
      print('Column with 50 Text widgets: ${ms}ms');
      expect(ms, lessThan(2000), reason: 'Should render in under 2 seconds');
    });

    testWidgets('Stack with 30 positioned widgets', (tester) async {
      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: List.generate(
                30,
                (index) => Positioned(
                  left: (index * 10) % 300,
                  top: (index * 15) % 400,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(child: Text('$index')),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      stopwatch.stop();
      final ms = stopwatch.elapsedMilliseconds;
      print('Stack with 30 positioned widgets: ${ms}ms');
      expect(ms, lessThan(1000), reason: 'Should render in under 1 second');
    });
  });
}
