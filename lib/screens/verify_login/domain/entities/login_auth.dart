import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:landa/screens/verify_login/domain/entities/user.dart';

class LoginAuth extends Equatable {

  const LoginAuth({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });
  
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'expire_in')
  final int expiresIn;
  final User user;

  @override
  List<Object?> get props => [
        accessToken,
        tokenType,
        expiresIn,
        user,
      ];
}
