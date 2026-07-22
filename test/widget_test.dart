import 'package:ethio_planner/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PrimaryButton renders its label and reports taps',
      (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            label: 'Save',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Save'), findsOneWidget);

    await tester.tap(find.byType(PrimaryButton));
    expect(tapped, isTrue);
  });
}
