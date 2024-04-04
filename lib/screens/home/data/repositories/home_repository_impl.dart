import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/home/data/datasources/datasources.dart';
import 'package:landa/screens/home/domain/entities/advertisement.dart';
import 'package:landa/screens/home/domain/repositories/repositories.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.remoteDatasource});

  final HomeRemoteDatasource remoteDatasource;
  @override
  Future<Either<Failure, List<Advertisement>>> getAllAds({
    int offset = 0,
    int limit = 10,
  }) async {
    try {
      final result = await remoteDatasource.getAllAds(
        offset: offset,
        limit: limit,
      );
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
