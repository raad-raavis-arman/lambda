import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/recommendations/domain/entities/entities.dart';

abstract interface class RecommendationRepository {
  Future<Either<Failure, bool>> sendRecommendation(
    Recommendation recommendation,
  );
}
