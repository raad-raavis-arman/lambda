import 'package:go_router/go_router.dart';
import 'package:landa/screens/home/home.dart';
import 'package:landa/screens/login/login.dart';
import 'package:landa/screens/verify_login/verify_login.dart';

class RoutePageBuilders {
  static GoRouterPageBuilder get loginPageBuilder => (context, state) {
        return const NoTransitionPage(child: LoginPage());
      };

  static GoRouterPageBuilder get verifyLoginPageBuilder => (context, state) {
        final mobileNumber = state.extra as String?;
        if (mobileNumber == null) {
          throw Exception('Mobile number must not be null');
        }
        return NoTransitionPage(
          child: VerifyLoginPage(
            mobileNumber: mobileNumber,
          ),
        );
      };

  static GoRouterPageBuilder get homePageBuilder => (context, state) {
        return const NoTransitionPage(child: HomePage());
      };
}
