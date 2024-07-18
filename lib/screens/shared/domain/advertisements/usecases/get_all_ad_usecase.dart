import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';
import 'package:landa/screens/shared/domain/advertisements/repositories/repositories.dart';

class GetAllAdUsecase extends BaseUseCase<List<Advertisement>, GetAllAdParam> {
  GetAllAdUsecase({required this.advertisementsRepository});

  final AdvertisementsRepository advertisementsRepository;

  @override
  Future<Either<Failure, List<Advertisement>>> call(GetAllAdParam params) {
    return advertisementsRepository.getAllAds(
      query: params.query,
    );
  }
}

class GetAllAdParam extends Equatable {
  const GetAllAdParam({required this.query});

  final AdvertisementQuery query;

  @override
  List<Object?> get props => [
        query,
      ];
}
