import 'package:landa/screens/advertisement_area/data/models/models.dart';

abstract interface class ProvinceDatasource {
  Future<List<CityModel>> getAllCities();
  Future<List<ProvinceModel>> getAllProvinces();
}
