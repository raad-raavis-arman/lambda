import 'package:flutter/material.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/flavor_config.dart';

class App extends StatelessWidget {
  const App({
    required this.flavorConfig,
    super.key,
  });

  final FlavorConfig flavorConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: flavorConfig.appTitle,
      routerConfig: RouteConfig.router,
    );
  }
}
