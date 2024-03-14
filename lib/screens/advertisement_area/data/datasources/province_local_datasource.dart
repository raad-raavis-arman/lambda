import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:landa/screens/advertisement_area/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_area/data/models/city_model.dart';
import 'package:landa/screens/advertisement_area/data/models/province_model.dart';

class ProvinceLocalDatasource implements ProvinceDatasource {
  @override
  Future<List<CityModel>> getAllCities() async {
    final rawString =
        await rootBundle.loadString('assets/jsons/provinces.json');
    final json = jsonDecode(rawString) as List<dynamic>;
    return List<CityModel>.generate(
      json.length,
      (index) => CityModel.fromJson(json[index]),
    );
  }

  @override
  Future<List<ProvinceModel>> getAllProvinces() async {
    final rawString =
        await rootBundle.loadString('assets/jsons/provinces.json');
    final json = jsonDecode(rawString) as List<dynamic>;
    return List<ProvinceModel>.generate(
      json.length,
      (index) => ProvinceModel.fromJson(
        json[index],
      ),
    ).toSet().toList();
  }
}
