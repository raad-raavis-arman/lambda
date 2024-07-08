import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/home/domain/entities/entities.dart';
import 'package:landa/screens/home/domain/repositories/repositories.dart';

class GetAllAdUsecase extends BaseUseCase<List<Advertisement>, GetAllAdParam> {
  GetAllAdUsecase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<Advertisement>>> call(GetAllAdParam params) {
    return homeRepository.getAllAds(
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
