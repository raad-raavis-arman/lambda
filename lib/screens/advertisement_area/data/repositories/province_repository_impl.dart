import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/screens/advertisement_area/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_area/domain/repositories/repositories.dart';

class ProvinceRepositoryImpl implements ProvinceRepository {
  ProvinceRepositoryImpl({required this.provinceLocalDatasource});

  final ProvinceLocalDatasource provinceLocalDatasource;

  @override
  Future<Either<Failure, List<City>>> getAllCities() async {
    try {
      final result = await provinceLocalDatasource.getAllCities();
      return Right(result);
    } on Exception catch (e) {
      return Left(LocalFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Province>>> getAllProvinces() async {
    try {
      final result = await provinceLocalDatasource.getAllProvinces();
      return Right(result);
    } on Exception catch (e) {
      return Left(LocalFailure(e.toString()));
    }
  }
}
