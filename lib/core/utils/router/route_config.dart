import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/advertisement_area/presentation/presentation.dart';
import 'package:landa/screens/advertisement_category/presentation/page/page.dart';
import 'package:landa/screens/advertisement_contact_info/presentation/presentation.dart';
import 'package:landa/screens/advertisement_date/presentation/presentation.dart';
import 'package:landa/screens/advertisement_details/presentation/presentation.dart';
import 'package:landa/screens/advertisement_price/presentation/presentation.dart';
import 'package:landa/screens/create_advertisement/presentation/presentation.dart';
import 'package:landa/screens/dashboard/presentation/page/page.dart';
import 'package:landa/screens/home/presentation/presentation.dart';
import 'package:landa/screens/login/presentation/presentation.dart';
import 'package:landa/screens/not_found/not_found_page.dart';
import 'package:landa/screens/profile/presentation/page/page.dart';
import 'package:landa/screens/splash/presentation/page/page.dart';
import 'package:landa/screens/verify_login/presentation/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteConfig {
  RouteConfig(this.preferences);

  final SharedPreferences preferences;

  GoRouter get router => GoRouter(
        initialLocation: RouteNames.splash,
        redirect: (context, state) {
          if (state.matchedLocation == RouteNames.splash ||
              state.matchedLocation == RouteNames.login ||
              state.matchedLocation == RouteNames.verifyLogin) {
            return null;
          }
          if (preferences.isUserAuthorized()) {
            return null;
          } else {
            return RouteNames.splash;
          }
        },
        errorPageBuilder: (context, state) {
          return NotFoundPage.page;
        },
        routes: [
          SplashPage.route,
          LoginPage.route,
          ProfilePage.route,
          VerifyLoginPage.route,
          DashboardPage.route,
          HomePage.route,
          CreateAdvertisementPage.route,
          CategoryPage.route,
          AdvertisementAreaPage.route,
          AdvertisementPricePage.route,
          AdvertisementDatePage.route,
          AdvertisementContactInfoPage.route,
          AdvertisementDetailsPage.route,
        ],
      );
}
