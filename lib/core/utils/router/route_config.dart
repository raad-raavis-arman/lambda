import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';

class RouteConfig {
  static final _router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        pageBuilder: RoutePageBuilders.loginPageBuilder,
      ),
      GoRoute(
        path: '/verifyLogin',
        name: RouteNames.verifyLogin,
        pageBuilder: RoutePageBuilders.verifyLoginPageBuilder,
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        pageBuilder: RoutePageBuilders.homePageBuilder,
      ),
    ],
  );

  static GoRouter get router => _router;
}
