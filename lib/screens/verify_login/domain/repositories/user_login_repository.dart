import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/verify_login/domain/entities/entities.dart';

abstract interface class UserLoginRepository {
  Future<Either<Failure, LoginAuth>> loginWithMobile(
    String mobileNumber,
    String otpCode,
  );
  Future<Either<Failure, LoginAuth>> loginWithEmail(
    String email,
    String otpCode,
  );
}
