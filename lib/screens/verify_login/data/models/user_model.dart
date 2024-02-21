import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/verify_login/domain/entities/entities.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.mobileNumber,
    required super.currentProvince,
    super.currentCity,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
