import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/verify_login/data/models/models.dart';
import 'package:landa/screens/verify_login/domain/entities/entities.dart';

part 'login_auth_model.g.dart';

@JsonSerializable()
class LoginAuthModel extends LoginAuth {
  const LoginAuthModel({
    required super.accessToken,
    required super.expiresIn,
    required super.tokenType,
    required super.issuedAt,
    required this.mUser,
  }) : super(user: mUser);

  factory LoginAuthModel.fromJson(Map<String, dynamic> json) =>
      _$LoginAuthModelFromJson(json);

  @JsonKey(name: 'user')
  final UserModel mUser;

  Map<String, dynamic> toJson() => _$LoginAuthModelToJson(this);
}
