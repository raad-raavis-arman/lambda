import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:landa/main_development.dart' as app;

import 'robots/robots.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'E2E-Unthenticated',
    () {
      testWidgets(
        'wrong mobile number',
        (tester) async {
          // Arrange
          app.main();
          await tester.pumpAndSettle();
          final loginRobot = LoginRobot(tester: tester);
          // Act
          await Future.delayed(const Duration(seconds: 2));
          loginRobot.verify();
          await loginRobot.enterMobileNumber(mobileNumber: '3333333');
          await Future.delayed(const Duration(seconds: 2));
          await loginRobot.tapNext();
          // Assert
          loginRobot.verifyErrorMessage();
        },
      );
    },
  );
}
