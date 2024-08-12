import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/recommendations/domain/entities/entities.dart';
import 'package:landa/screens/recommendations/domain/repositories/repositories.dart';

final class SendRecommendationUsecase
    extends BaseUseCase<bool, SendRecommendationParam> {
  SendRecommendationUsecase({required this.recommendationRepository});

  final RecommendationRepository recommendationRepository;
  @override
  Future<Either<Failure, bool>> call(SendRecommendationParam params) {
    return recommendationRepository.sendRecommendation(params.recommendation);
  }
}

final class SendRecommendationParam {
  SendRecommendationParam({required this.recommendation});

  final Recommendation recommendation;
}
