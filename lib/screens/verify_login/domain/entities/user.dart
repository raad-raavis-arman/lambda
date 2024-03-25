import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class User extends Equatable {

  const User({
    required this.id,
    required this.mobileNumber,
    required this.currentProvinceId,
    this.currentCityId,
  });
  
  final int id;
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @JsonKey(name: 'current_province_id')
  final String currentProvinceId;
  @JsonKey(name: 'current_city_id')
  final String? currentCityId;

  @override
  List<Object?> get props => [
        id,
        mobileNumber,
        currentProvinceId,
        currentCityId,
      ];
}
