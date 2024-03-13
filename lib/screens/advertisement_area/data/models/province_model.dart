import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';

part 'province_model.g.dart';

@JsonSerializable()
class ProvinceModel extends Province {
  const ProvinceModel({
    required super.provinceId,
    required super.provinceName,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);
}
