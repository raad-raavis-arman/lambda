import 'dart:async';

import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/home/data/datasources/datasources.dart';
import 'package:landa/screens/home/data/models/advertisement_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class HomeRemoteDatasource implements HomeDatasource {
  const HomeRemoteDatasource({
    required this.restClientService,
  });

  final RestClientService restClientService;
  @override
  Future<List<AdvertisementModel>> getAllAds({
    required int offset,
    required int limit,
  }) async {
    try {
      final result = await restClientService.get(
        '/advertisement',
        queryParameters: {
          'offset': offset,
          'limit': limit,
        },
      );
      if (result['success'] == true) {
        final jsonArray = result['data'] as List<dynamic>;
        return List<AdvertisementModel>.from(
          jsonArray.map(
            (e) => AdvertisementModel.fromJson(e as Map<String, dynamic>),
          ),
        );
      } else {
        throw MException(
          errorMessage: 'failed to get all advertisement',
          data: result,
        );
      }
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (e, s) {
      unawaited(
        Sentry.captureException(e, stackTrace: s),
      );
      rethrow;
    }
  }
}
