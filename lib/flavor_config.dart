import 'dart:io';

import 'package:flutter/foundation.dart';

class FlavorConfig {
  const FlavorConfig({
    required this.appTitle,
    required this.flavorType,
  });
  final String appTitle;
  final FlavorType flavorType;

  String get baseUrl {
    return switch (flavorType) {
      FlavorType.development => (!kIsWeb && Platform.isAndroid)
          ? 'http://10.0.2.2:8000/api/v1/'
          : 'http://127.0.0.1:8000/api/v1/',
      FlavorType.production => 'https://lambda-api.gymino.ir/api/v1/',
      FlavorType.staging => 'https://lambda-api.gymino.ir/api/v1/',
    };
  }
}

enum FlavorType { development, staging, production }
