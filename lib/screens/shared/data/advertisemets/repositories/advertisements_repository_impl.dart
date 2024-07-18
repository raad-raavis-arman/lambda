import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/shared/data/advertisemets/datasources/datasources.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';
import 'package:landa/screens/shared/domain/advertisements/repositories/repositories.dart';

class AdvertisementsRepositoryImpl implements AdvertisementsRepository {
  AdvertisementsRepositoryImpl({required this.remoteDatasource});

  final AdvertisementsRemoteDatasource remoteDatasource;
  @override
  Future<Either<Failure, List<Advertisement>>> getAllAds({
    AdvertisementQuery query = const AdvertisementQuery(),
  }) async {
    try {
      final result = await remoteDatasource.getAllAds(
        query: query,
      );
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Advertisement>>> getMyAds() async {
    try {
      final result = await remoteDatasource.getMyAds();
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Advertisement>>> getBookmarkedAds() async {
    try {
      final result = await remoteDatasource.getBookmarkedAds();
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
