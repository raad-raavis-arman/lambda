import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/advertisement_details/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_details/domain/repositories/repositories.dart';

class AdvertisementDetailsRepositoryImpl
    implements AdvertisementDetailsRepository {
  AdvertisementDetailsRepositoryImpl({
    required this.advertisementDetailsRemoteDatasource,
  });

  final AdvertisementDetailsRemoteDatasource
      advertisementDetailsRemoteDatasource;

  @override
  Future<Either<Failure, bool>> bookmark(int advertisementId) async {
    try {
      final result =
          await advertisementDetailsRemoteDatasource.bookmark(advertisementId);
      return Right(result);
    } on MException catch (e) {
      return Left(
        ServerFailure(e.errorMessage),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> removeBookmark(int advertisementId) async {
    try {
      final result = await advertisementDetailsRemoteDatasource
          .removeBookmark(advertisementId);
      return Right(result);
    } on MException catch (e) {
      return Left(
        ServerFailure(e.errorMessage),
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
