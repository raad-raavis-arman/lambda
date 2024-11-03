import 'package:landa/flavor_config.dart';
import 'package:landa/main_common.dart';

void main() {
  const flavorConfig = FlavorConfig(
    appTitle: 'Landa-DEV',
    flavorType: FlavorType.development,
  );
  mainCommon(flavorConfig);
}
