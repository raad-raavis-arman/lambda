import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/screens/advertisement_area/presentation/presentation.dart';
import 'package:landa/screens/advertisement_category/presentation/page/page.dart';
import 'package:landa/screens/advertisement_contact_info/presentation/presentation.dart';
import 'package:landa/screens/advertisement_date/presentation/presentation.dart';
import 'package:landa/screens/advertisement_price/presentation/presentation.dart';
import 'package:landa/screens/create_advertisement/presentation/presentation.dart';
import 'package:landa/screens/home/presentation/presentation.dart';
import 'package:landa/screens/login/presentation/presentation.dart';
import 'package:landa/screens/verify_login/presentation/presentation.dart';

class RouteConfig {
  static final _router = GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      LoginPage.route,
      VerifyLoginPage.route,
      HomePage.route,
      CreateAdvertisementPage.route,
      CategoryPage.route,
      AdvertisementAreaPage.route,
      AdvertisementPricePage.route,
      AdvertisementDatePage.route,
      AdvertisementContactInfoPage.route,
    ],
  );

  static GoRouter get router => _router;
}
