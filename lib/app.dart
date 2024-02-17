import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/flavor_config.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';

class AppRootPage extends StatelessWidget {
  const AppRootPage({
    required this.flavorConfig,
    super.key,
  });
  final FlavorConfig flavorConfig;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LangBloc()
            ..add(
              LangFetchLocaleEvent(),
            ),
        ),
      ],
      child: _AppRootView(
        flavorConfig: flavorConfig,
      ),
    );
  }
}

class _AppRootView extends StatelessWidget {
  const _AppRootView({
    required this.flavorConfig,
  });

  final FlavorConfig flavorConfig;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final langState = context.watch<LangBloc>().state;
        return MaterialApp.router(
          supportedLocales: L10n.all,
          locale: langState.locale,
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
    );
  }
}
