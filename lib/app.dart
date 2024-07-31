import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/m_web_frame.dart';
import 'package:landa/di_service.dart';
import 'package:landa/flavor_config.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';
import 'package:landa/screens/advertisement_area/presentation/bloc/bloc.dart';
import 'package:landa/screens/advertisement_category/presentation/bloc/category_bloc.dart';
import 'package:landa/screens/home/presentation/bloc/home_bloc.dart';
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
        BlocProvider(
          create: (_) => NewVersionBloc(
            packageInfo: locator.get(),
            preferences: locator.get(),
          )..add(CheckNewVersionEvent()),
        ),
      ],
      child: MWebFrame(
        child: _AppRootView(
          flavorConfig: flavorConfig,
        ),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            getAllAdUsecase: locator.get(),
            getCategoriesUsescase: locator.get(),
          )
            ..add(
              const HomeGetAllAdEvent(),
            )
            ..add(
              HomeGetAllCategoriesEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(
            getCategoriesUsescase: locator.get(),
            suggestCategoryUsescase: locator.get(),
          )..add(GetCategoriesEvent()),
        ),
        BlocProvider(
          create: (_) => AdvertisementAreaBloc(
            citiesUsecase: locator.get(),
            provincesUsecase: locator.get(),
          )..add(AdvertisementAreaInitialEvent()),
        ),
      ],
      child: MaterialApp.router(
        themeMode: context.read<ThemeBloc>().state.mode,
        darkTheme: DarkTheme(
          fontFamily: context.read<LangBloc>().state.fontFamily,
        ).data,
        theme: LightTheme(
          fontFamily: context.read<LangBloc>().state.fontFamily,
        ).data,
        supportedLocales: L10n.all,
        locale: context.read<LangBloc>().state.locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: flavorConfig.appTitle,
        routerConfig: locator.get<RouteConfig>().router,
        debugShowCheckedModeBanner:
            flavorConfig.flavorType == FlavorType.production,
      ),
    );
  }
}
