import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/verify_login/domain/entities/entities.dart';
import 'package:landa/screens/verify_login/domain/repositories/repositories.dart';

class UserLoginUsescase implements BaseUseCase<LoginAuth, LoginParam> {
  final UserLoginRepository userLoginRepository;

  UserLoginUsescase({required this.userLoginRepository});

  @override
  Future<Either<Failure, LoginAuth>> call(LoginParam params) =>
      userLoginRepository.loginWithMobile(params.mobileNumber, params.otpCode);
}

class LoginParam extends Equatable {
  final String mobileNumber;
  final String otpCode;

  const LoginParam({
    required this.mobileNumber,
    required this.otpCode,
  });

  @override
  List<Object?> get props => [
        mobileNumber,
        otpCode,
      ];
}
