import 'package:flutter_test/flutter_test.dart';
import 'package:ethio_planner/app.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Ethio Planner'), findsOneWidget);
  });
}
