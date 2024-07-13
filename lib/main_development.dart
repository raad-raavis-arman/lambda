import 'dart:io';

import 'package:landa/flavor_config.dart';
import 'package:landa/main_common.dart';

void main(List<String> args) {
  final flavorConfig = FlavorConfig(
    appTitle: 'Landa-DEV',
    flavorType: FlavorType.development,
    baseUrl: Platform.isAndroid
        ? 'http://10.0.2.2:8000/api/v1/'
        : 'http://127.0.0.1:8000/api/v1/',
  );
  mainCommon(flavorConfig);
}
