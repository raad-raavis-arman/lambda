import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/verify_login/data/datasources/datasources.dart';
import 'package:landa/screens/verify_login/domain/entities/entities.dart';
import 'package:landa/screens/verify_login/domain/repositories/repositories.dart';

final class UserLoginRepositoryImpl implements UserLoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  UserLoginRepositoryImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, LoginAuth>> loginWithEmail(
    String email,
    String otpCode,
  ) async {
    try {
      final result = await loginRemoteDataSource.loginWithEmail(
        email,
        otpCode,
      );
      return Right(result);
    } on MDioException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, LoginAuth>> loginWithMobile(
    String mobileNumber,
    String otpCode,
  ) async {
    try {
      final result = await loginRemoteDataSource.loginWithMobile(
        mobileNumber,
        mobileNumber,
      );
      return Right(result);
    } on MDioException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
