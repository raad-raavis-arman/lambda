import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class City extends Equatable {
  const City({
    required this.id,
    required this.name,
    required this.provinceId,
    required this.provinceName,
  });

  @JsonKey(name: 'province_id')
  final String provinceId;
  @JsonKey(name: 'province_name')
  final String provinceName;
  @JsonKey(name: 'city_id')
  final String id;
  @JsonKey(name: 'city_name')
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
        provinceId,
        provinceName,
      ];
}
