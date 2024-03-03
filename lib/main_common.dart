import 'package:flutter/material.dart';
import 'package:landa/app.dart';
import 'package:landa/di_service.dart';
import 'package:landa/flavor_config.dart';
import 'package:url_strategy/url_strategy.dart';

void mainCommon(FlavorConfig flavorConfig) {
  setup();
  setPathUrlStrategy();
  runApp(
    AppRootPage(
      flavorConfig: flavorConfig,
    ),
  );
}
