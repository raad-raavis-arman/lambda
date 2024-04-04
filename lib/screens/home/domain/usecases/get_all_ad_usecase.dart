import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/home/domain/entities/advertisement.dart';
import 'package:landa/screens/home/domain/repositories/repositories.dart';

class GetAllAdUsecase extends BaseUseCase<List<Advertisement>, GetAllAdParam> {
  GetAllAdUsecase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<Advertisement>>> call(GetAllAdParam params) {
    return homeRepository.getAllAds(
      offset: params.offset,
      limit: params.limit,
    );
  }
  
}

class GetAllAdParam extends Equatable {
  const GetAllAdParam({required this.offset, required this.limit});

  final int offset;
  final int limit;

  @override
  List<Object?> get props => [
        offset,
        limit,
      ];
}
