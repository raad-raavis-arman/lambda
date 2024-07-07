import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:landa/core/utils/utils.dart';
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
      child: Material(
        color: const Color(0xFF006A6A),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
              minHeight: double.infinity,
            ),
            child: LayoutBuilder(
              builder: (context, constraint) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    size: Size(constraint.maxWidth, constraint.maxHeight),
                  ),
                  child: _AppRootView(
                    flavorConfig: flavorConfig,
                  ),
                );
              },
            ),
          ),
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
          )..add(
              const HomeGetAllAdEvent(),
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
      child: Builder(
        builder: (context) {
          final langState = context.watch<LangBloc>().state;
          final themeState = context.watch<ThemeBloc>().state;
          return MaterialApp.router(
            themeMode: themeState.mode,
            darkTheme: DarkTheme(fontFamily: langState.fontFamily).data,
            theme:
                LightTheme(fontFamily: langState.fontFamily, context: context)
                    .data,
            supportedLocales: L10n.all,
            locale: langState.locale,
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
          ).animate().fadeIn(
                duration: const Duration(milliseconds: 400),
              );
        },
      ),
    );
  }
}
