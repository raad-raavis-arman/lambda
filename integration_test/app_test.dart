import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:landa/main_development.dart' as app;

void main() {
  enableFlutterDriverExtension();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('LoginTest', () {
    testWidgets(
      'user should enter to verify otp after inserting mobile number '
      'and press enter',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();

        //
        final loginInput = find.byType(TextFormField).first;
        final nextButton = find.byType(ElevatedButton).first;

        await tester.enterText(loginInput, '09377729207');
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 3));
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
      },
    );
  });
}
