import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/screens/home/home.dart';
import 'package:landa/screens/login/login.dart';
import 'package:landa/screens/verify_login/verify_login.dart';

class RoutePageBuilders {
  static get loginPageBuilder => (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: LoginPage());
      };

  static get verifyLoginPageBuilder =>
      (BuildContext context, GoRouterState state) {
        final mobileNumber = state.extra as String;
        return NoTransitionPage(
          child: VerifyLoginPage(
            mobileNumber: mobileNumber,
          ),
        );
      };

  static get homePageBuilder => (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: HomePage());
      };
}
