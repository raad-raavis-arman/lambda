import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/login/domain/entities/entities.dart';

abstract interface class UserOtpRepository {
  Future<Either<Failure, Otp>> sendMobileOtp(String mobileNumber);
  Future<Either<Failure, Otp>> sendEmailOtp(String email);
}
