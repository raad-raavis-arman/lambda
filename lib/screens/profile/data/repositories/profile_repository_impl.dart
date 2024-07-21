import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/profile/data/datasources/datasources.dart';
import 'package:landa/screens/profile/domain/repositories/repositories.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.profileRemoteDatasource});

  final ProfileRemoteDatasource profileRemoteDatasource;

  @override
  Future<Either<Failure, bool>> signout() async {
    try {
      final isSignedOut = await profileRemoteDatasource.signout();
      return Right(isSignedOut);
    } on MException catch (e) {
      return Left(
        ServerFailure(
          e.errorMessage,
        ),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
