import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/verify_login/data/datasources/datasources.dart';
import 'package:landa/screens/verify_login/domain/entities/entities.dart';
import 'package:landa/screens/verify_login/domain/repositories/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class UserLoginRepositoryImpl implements UserLoginRepository {
  UserLoginRepositoryImpl({
    required this.loginRemoteDataSource,
    required this.preferences,
  });
  final SharedPreferences preferences;

  final LoginRemoteDataSource loginRemoteDataSource;
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
    } on MException catch (e) {
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
        otpCode,
      );
      await preferences.setString(
        PreferenceKeys.userAuth,
        jsonEncode(
          result.toJson(),
        ),
      );
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
