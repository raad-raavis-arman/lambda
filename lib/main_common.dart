import 'package:flutter/material.dart';
import 'package:landa/app.dart';
import 'package:landa/di_service.dart';
import 'package:landa/flavor_config.dart';

void mainCommon(FlavorConfig flavorConfig) {
  setup();
  runApp(
    AppRootPage(
      flavorConfig: flavorConfig,
    ),
  );
}
