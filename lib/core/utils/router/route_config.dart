import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/screens/advertisement_category/presentation/page/page.dart';
import 'package:landa/screens/create_advertisement/presentation/presentation.dart';
import 'package:landa/screens/home/presentation/presentation.dart';
import 'package:landa/screens/login/presentation/presentation.dart';
import 'package:landa/screens/verify_login/presentation/presentation.dart';

class RouteConfig {
  static final _router = GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        pageBuilder: LoginPage.routeBuilder,
      ),
      GoRoute(
        path: RouteNames.verifyLogin,
        name: RouteNames.verifyLogin,
        pageBuilder: VerifyLoginPage.routeBuilder,
      ),
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: HomePage.routeBuilder,
      ),
      GoRoute(
        path: RouteNames.createAdvertisement,
        name: RouteNames.createAdvertisement,
        pageBuilder: CreateAdvertisementPage.routeBuilder,
      ),
      GoRoute(
        path: RouteNames.category,
        name: RouteNames.category,
        pageBuilder: CategoryPage.routeBuilder,
      ),
    ],
  );

  static GoRouter get router => _router;
}
