import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_area/domain/repositories/repositories.dart';

final class CitiesUsecase extends BaseUseCase<List<City>, NoParams> {
  CitiesUsecase({required this.provinceRepository});

  final ProvinceRepository provinceRepository;
  @override
  Future<Either<Failure, List<City>>> call(NoParams params) {
    return provinceRepository.getAllCities();
  }
}
