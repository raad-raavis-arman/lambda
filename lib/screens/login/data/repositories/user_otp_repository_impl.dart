import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/login/data/datasources/datasources.dart';
import 'package:landa/screens/login/domain/entities/otp.dart';
import 'package:landa/screens/login/domain/repositories/repositories.dart';

final class UserOtpRepositoryImpl implements UserOtpRepository {
  final OtpRemoteDataSource otpRemoteDataSource;

  UserOtpRepositoryImpl({required this.otpRemoteDataSource});
  @override
  Future<Either<Failure, Otp>> sendEmailOtp(String email) async {
    try {
      final result = await otpRemoteDataSource.sendEmailOtp(email);
      return Right(result);
    } on MDioException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Otp>> sendMobileOtp(String mobileNumber) async {
    try {
      final result = await otpRemoteDataSource.sendMobileOtp(mobileNumber);
      return Right(result);
    } on MDioException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
