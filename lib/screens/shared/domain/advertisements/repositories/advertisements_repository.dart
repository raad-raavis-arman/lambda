import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';

abstract interface class AdvertisementsRepository {
  Future<Either<Failure, List<Advertisement>>> getAllAds({
    AdvertisementQuery query = const AdvertisementQuery(),
  });
  
  Future<Either<Failure, List<Advertisement>>> getMyAds();
  Future<Either<Failure, List<Advertisement>>> getBookmarkedAds();
}
