import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/core/utils/theme/theme.dart';
import 'package:landa/flavor_config.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';
import 'package:landa/screens/verify_login/presentation/bloc/bloc.dart';

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
          create: (_) => OtpTimerBloc(),
        ),
        BlocProvider(
          create: (_) => LangBloc()
            ..add(
              LangFetchLocaleEvent(),
            ),
        ),
        BlocProvider(
          create: (_) => ThemeBloc(),
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
        final themeState = context.watch<ThemeBloc>().state;
        final fontFamily =
            langState.locale.languageCode == 'fa' ? 'Yekan' : 'Poppins';
        return MaterialApp.router(
          themeMode: themeState.mode,
          darkTheme: DarkTheme(fontFamily: fontFamily).data,
          theme: LightTheme(fontFamily: fontFamily).data,
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
          debugShowCheckedModeBanner:
              flavorConfig.flavorType == FlavorType.production,
        );
      },
    );
  }
}
