import 'package:ethio_planner/app/app.dart';
import 'package:ethio_planner/core/config/app_config.dart';
import 'package:ethio_planner/core/config/app_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Smoke test: the app must boot offline and render its primary navigation.
/// This is the seed for the full offline/sync integration suite (SRS §68).
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    AppConfig.initialize(AppConfig.forFlavor(AppFlavor.development));
  });

  testWidgets('boots and shows the app shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(App), findsOneWidget);
  });
}
