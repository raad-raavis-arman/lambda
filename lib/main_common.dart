import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:landa/app.dart';
import 'package:landa/di_service.dart';
import 'package:landa/flavor_config.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> mainCommon(FlavorConfig flavorConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup(flavorConfig);
  setPathUrlStrategy();
  if (kIsWeb) {
    MetaSEO().config();
  }
  await dotenv.load();

  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.get('SentryDSN');
    },
  );

  runApp(
    AppRootPage(
      flavorConfig: flavorConfig,
    ),
  );
}
