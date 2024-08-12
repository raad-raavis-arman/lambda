import 'dart:async';

import 'package:dio/dio.dart';
import 'package:landa/core/error/m_exception.dart';
import 'package:landa/core/exceptions/sentry_exception.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/recommendations/data/models/recommendation_model.dart';

abstract interface class RecommendationDatasource {
  Future<bool> sendRecommendation(RecommendationModel recommendationModel);
}

final class RecommendationRemoteDatasource implements RecommendationDatasource {
  RecommendationRemoteDatasource({required this.restClientService});

  final RestClientService restClientService;

  @override
  Future<bool> sendRecommendation(
    RecommendationModel recommendationModel,
  ) async {
    try {
      final result = await restClientService.post(
        '/recommendation',
        data: recommendationModel.toJson(),
      );
      return result['success'];
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (e, s) {
      unawaited(
        sentToSentry(exception: e, stackTrace: s),
      );
      rethrow;
    }
  }
}
