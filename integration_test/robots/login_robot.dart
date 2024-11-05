import 'package:flutter_test/flutter_test.dart';
import 'package:landa/core/utils/utils.dart';

import 'test_robot.dart';

class LoginRobot extends TestRobot {
  LoginRobot({
    required super.tester,
  });

  void verify() {
    final loginScreen = find.byKey(WidgetKeys.loginScreen);
    expect(loginScreen, findsOneWidget);
  }

  Future<void> enterMobileNumber({required String mobileNumber}) async {
    final mobileNumberField = find.byKey(WidgetKeys.loginNumberInputField);
    expect(mobileNumberField, findsOneWidget);
    await tester.enterText(mobileNumberField, mobileNumber);
    await tester.pumpAndSettle();
  }

  Future<void> tapNext() async {
    final nextButton = find.byKey(WidgetKeys.loginNextButton);
    expect(nextButton, findsOneWidget);
    await tester.ensureVisible(nextButton);
    await tester.pumpAndSettle();
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyErrorMessage() {
    final errorMessageWidget = find.text(l10n.pleaseEnterValidMobileNumber);
    expect(errorMessageWidget, findsOneWidget);
  }

  void verifyOtpScreen() {
    final otpScreen = find.byKey(WidgetKeys.verifyLoginScreen);
    expect(otpScreen, findsOneWidget);
  }
}
