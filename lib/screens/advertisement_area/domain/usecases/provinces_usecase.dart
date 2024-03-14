import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_area/domain/repositories/repositories.dart';

final class ProvincesUsecase extends BaseUseCase<List<Province>, NoParams> {
  ProvincesUsecase({required this.provinceRepository});

  final ProvinceRepository provinceRepository;
  @override
  Future<Either<Failure, List<Province>>> call(NoParams params) {
    return provinceRepository.getAllProvinces();
  }
}
