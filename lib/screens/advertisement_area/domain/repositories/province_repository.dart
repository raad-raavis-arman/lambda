import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';

abstract interface class ProvinceRepository {
  Future<Either<Failure, List<City>>> getAllCities();
  Future<Either<Failure, List<Province>>> getAllProvinces();
}
