import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class User extends Equatable {

  const User({
    required this.id,
    required this.mobileNumber,
    required this.currentProvince,
    this.currentCity,
  });
  
  final int id;
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @JsonKey(name: 'current_province_id')
  final int currentProvince;
  @JsonKey(name: 'current_city_id')
  final int? currentCity;

  @override
  List<Object?> get props => [
        id,
        mobileNumber,
        currentProvince,
        currentCity,
      ];
}
