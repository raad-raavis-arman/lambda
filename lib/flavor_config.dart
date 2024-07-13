class FlavorConfig {
  const FlavorConfig({
    required this.appTitle,
    required this.flavorType,
    required this.baseUrl,
  });
  final String appTitle;
  final FlavorType flavorType;
  final String baseUrl;
}

enum FlavorType { development, staging, production }
