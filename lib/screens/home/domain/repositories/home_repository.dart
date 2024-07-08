import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/home/domain/entities/entities.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Advertisement>>> getAllAds({
    AdvertisementQuery query = const AdvertisementQuery(),
  });
}
