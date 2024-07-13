import 'package:landa/flavor_config.dart';
import 'package:landa/main_common.dart';

void main(List<String> args) {
  const flavorConfig = FlavorConfig(
    appTitle: 'Landa',
    flavorType: FlavorType.production,
    baseUrl: 'https://lambda-api.gymino.ir/api/v1/',
  );

  mainCommon(flavorConfig);
}
