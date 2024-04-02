import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/home/domain/entities/entities.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Advertisement>>> getAllAds({
    int offset = 0,
    int limit = 10,
  });
}
