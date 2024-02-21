import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/screens/home/home.dart';
import 'package:landa/screens/login/login.dart';
import 'package:landa/screens/verify_login/verify_login.dart';

class RouteConfig {
  static final _router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        pageBuilder: LoginPage.routeBuilder,
      ),
      GoRoute(
        path: '/verifyLogin',
        name: RouteNames.verifyLogin,
        pageBuilder: VerifyLoginPage.routeBuilder,
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        pageBuilder: HomePage.routeBuilder,
      ),
    ],
  );

  static GoRouter get router => _router;
}
