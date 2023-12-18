import 'package:flutter/material.dart';
import 'package:landa/flavor_config.dart';
import 'package:landa/screens/login/login.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.flavorConfig,
  });

  final FlavorConfig flavorConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: flavorConfig.appTitle,
      home: const LoginPage(),
    );
  }
}
