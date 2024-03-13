import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel extends City {
  const CityModel({
    required super.cityId,
    required super.cityName,
    required super.provinceId,
    required super.provinceName,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
