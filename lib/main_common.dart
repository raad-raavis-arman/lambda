import 'package:flutter/material.dart';
import 'package:landa/app.dart';
import 'package:landa/flavor_config.dart';

void mainCommon(FlavorConfig flavorConfig) {
  runApp(
    App(
      flavorConfig: flavorConfig,
    ),
  );
}
