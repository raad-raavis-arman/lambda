import 'package:flutter/material.dart';
import 'package:landa/app.dart';
import 'package:landa/di_service.dart';
import 'package:landa/flavor_config.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> mainCommon(FlavorConfig flavorConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  setPathUrlStrategy();
  runApp(
    AppRootPage(
      flavorConfig: flavorConfig,
    ),
  );
}
