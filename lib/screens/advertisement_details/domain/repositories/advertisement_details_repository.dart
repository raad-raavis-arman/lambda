import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';

abstract interface class AdvertisementDetailsRepository {
  Future<Either<Failure, bool>> bookmark(int advertisementId);
  Future<Either<Failure, bool>> removeBookmark(int advertisementId);
}
