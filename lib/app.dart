import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/flavor_config.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';

class App extends StatelessWidget {
  const App({
    required this.flavorConfig,
    super.key,
  });

  final FlavorConfig flavorConfig;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LangBloc(),
      child: BlocBuilder<LangBloc, LangState>(
        builder: (context, lang) {
          context.read<LangBloc>().add(LangFetchLocalEvent());
          return MaterialApp.router(
            supportedLocales: L10n.all,
            locale: lang.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: flavorConfig.appTitle,
            routerConfig: RouteConfig.router,
          );
        },
      ),
    );
  }
}
