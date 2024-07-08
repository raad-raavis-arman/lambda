import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/home/data/datasources/datasources.dart';
import 'package:landa/screens/home/domain/entities/entities.dart';
import 'package:landa/screens/home/domain/repositories/repositories.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.remoteDatasource});

  final HomeRemoteDatasource remoteDatasource;
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
}
