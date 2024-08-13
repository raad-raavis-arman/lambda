import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/recommendations/data/datasources/recommendation_remote_datasource.dart';
import 'package:landa/screens/recommendations/data/models/recommendation_model.dart';
import 'package:landa/screens/recommendations/domain/entities/recommendation.dart';
import 'package:landa/screens/recommendations/domain/repositories/repositories.dart';

final class RecommendationRepositoryImpl implements RecommendationRepository {
  RecommendationRepositoryImpl({required this.recommendationRemoteDatasource});

  final RecommendationRemoteDatasource recommendationRemoteDatasource;
  @override
  Future<Either<Failure, bool>> sendRecommendation(
    Recommendation recommendation,
  ) async {
    try {
      final result = await recommendationRemoteDatasource.sendRecommendation(
        RecommendationModel(
          subject: recommendation.subject,
          description: recommendation.description,
        ),
      );
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
