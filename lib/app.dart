import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/flavor_config.dart';
import 'package:landa/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required this.flavorConfig,
    super.key,
  });

  final FlavorConfig flavorConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: L10n.all,
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: flavorConfig.appTitle,
      routerConfig: RouteConfig.router,
    );
  }
}
