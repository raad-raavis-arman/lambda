import 'package:landa/flavor_config.dart';
import 'package:landa/main_common.dart';

void main(List<String> args) {
  const flavorConfig = FlavorConfig(
    appTitle: 'Landa-DEV',
    flavorType: FlavorType.production,
  );
  mainCommon(flavorConfig);
}