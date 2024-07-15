import 'dart:async';

import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/network/rest_client_service.dart';
import 'package:landa/screens/advertisement_details/data/datasources/datasources.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class AdvertisementDetailsRemoteDatasource
    implements AdvertisementDetailsDatasource {
  AdvertisementDetailsRemoteDatasource({required this.restClientService});

  final RestClientService restClientService;

  @override
  Future<bool> bookmark(int advertisementId) async {
    try {
      final response = await restClientService.post(
        '/advertisement/setMarked/$advertisementId',
      );
      return response['success'];
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (e, s) {
      unawaited(
        Sentry.captureException(e, stackTrace: s),
      );
      rethrow;
    }
  }

  @override
  Future<bool> removeBookmark(int advertisementId) async {
    try {
      final response = await restClientService.post(
        '/advertisement/removeMarked/$advertisementId',
      );
      return response['success'];
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
