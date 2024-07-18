import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';
import 'package:landa/screens/shared/domain/advertisements/repositories/repositories.dart';

class GetMyMarkedAdsUsecase extends BaseUseCase<List<Advertisement>, NoParams> {
  GetMyMarkedAdsUsecase({required this.advertisementsRepository});

  final AdvertisementsRepository advertisementsRepository;

  @override
  Future<Either<Failure, List<Advertisement>>> call(NoParams params) {
    return advertisementsRepository.getBookmarkedAds();
  }
}
