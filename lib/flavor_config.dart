class FlavorConfig {
  final String appTitle;
  final FlavorType flavorType;

  const FlavorConfig({
    required this.appTitle,
    required this.flavorType,
  });
}

enum FlavorType { development, staging, production }
