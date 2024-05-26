class FlavorConfig {
  const FlavorConfig({
    required this.appTitle,
    required this.flavorType,
  });
  final String appTitle;
  final FlavorType flavorType;
}

enum FlavorType { development, staging, production }
