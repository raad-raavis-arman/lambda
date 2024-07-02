import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:landa/app.dart';
import 'package:landa/di_service.dart';
import 'package:landa/flavor_config.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> mainCommon(FlavorConfig flavorConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  setPathUrlStrategy();
  if (kIsWeb) {
    MetaSEO().config();
  }
  await dotenv.load();

  runApp(
    Material(
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
                child: AppRootPage(
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
