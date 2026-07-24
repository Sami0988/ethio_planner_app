import 'package:ethio_planner/core/localization/locale_provider.dart';
import 'package:ethio_planner/features/today/presentation/pages/today_page.dart';
import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _pumpToday(
  WidgetTester tester, {
  Locale locale = const Locale('en'),
}) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        locale: locale,
        supportedLocales: supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const TodayPage(),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets('renders title and section headers in English', (tester) async {
    await _pumpToday(tester);

    expect(find.text('Walia Planner'), findsOneWidget);
    expect(find.text('UP NEXT'), findsOneWidget);
    expect(find.text('EVENTS'), findsOneWidget);
    expect(find.text('REMINDERS'), findsOneWidget);
  });

  testWidgets('shows a labelled overdue reminder (not colour only)', (
    tester,
  ) async {
    await _pumpToday(tester);
    expect(find.text('Overdue'), findsOneWidget);
  });

  testWidgets('Quick Add offers Event, Reminder and Note', (tester) async {
    await _pumpToday(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Event'), findsOneWidget);
    expect(find.text('Reminder'), findsOneWidget);
    expect(find.text('Note'), findsOneWidget);
  });

  testWidgets('renders the Amharic app title', (tester) async {
    await _pumpToday(tester, locale: const Locale('am'));
    expect(find.text('ዋሊያ ፕላነር'), findsOneWidget);
  });
}
