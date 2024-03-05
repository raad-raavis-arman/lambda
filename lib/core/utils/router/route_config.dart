import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/screens/create_advertisement/presentation/presentation.dart';
import 'package:landa/screens/home/presentation/presentation.dart';
import 'package:landa/screens/login/presentation/presentation.dart';
import 'package:landa/screens/verify_login/presentation/presentation.dart';

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
      GoRoute(
        path: '/createAdvertisement',
        name: RouteNames.createAdvertisement,
        pageBuilder: CreateAdvertisementPage.routeBuilder,
      ),
    ],
  );

  static GoRouter get router => _router;
}
