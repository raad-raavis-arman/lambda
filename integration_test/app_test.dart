import 'package:integration_test/integration_test.dart';
import 'e2e_unauth_test.dart' as e2e_unauth_test;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  e2e_unauth_test.main();
}
