import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/create_advertisement/domain/entities/entities.dart';

abstract interface class CreateAdvertisementRepository {
  Future<Either<Failure, bool>> create(CreateAdvertisement createAdvertisement);
}
