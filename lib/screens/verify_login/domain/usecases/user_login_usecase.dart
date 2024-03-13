import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/verify_login/domain/entities/entities.dart';
import 'package:landa/screens/verify_login/domain/repositories/repositories.dart';

class UserLoginUsescase extends BaseUseCase<LoginAuth, LoginParam> {

  UserLoginUsescase({required this.userLoginRepository});

  final UserLoginRepository userLoginRepository;

  @override
  Future<Either<Failure, LoginAuth>> call(LoginParam params) =>
      userLoginRepository.loginWithMobile(params.mobileNumber, params.otpCode);
}

class LoginParam extends Equatable {

  const LoginParam({
    required this.mobileNumber,
    required this.otpCode,
  });
  
  final String mobileNumber;
  final String otpCode;

  @override
  List<Object?> get props => [
        mobileNumber,
        otpCode,
      ];
}
