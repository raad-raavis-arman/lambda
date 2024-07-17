import 'dart:async';

import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/exceptions/exceptions.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/shared/data/advertisemets/datasources/datasources.dart';
import 'package:landa/screens/shared/data/advertisemets/models/advertisement_model.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';

class AdvertisementsRemoteDatasource implements AdvertisementsDatasource {
  const AdvertisementsRemoteDatasource({
    required this.restClientService,
  });

  final RestClientService restClientService;
  @override
  Future<List<AdvertisementModel>> getAllAds({
    required AdvertisementQuery query,
  }) async {
    try {
      final result = await restClientService.get(
        '/advertisement',
        queryParameters: query.toJson(),
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
        sentToSentry(exception: e, stackTrace: s),
      );
      rethrow;
    }
  }

  @override
  Future<List<AdvertisementModel>> getMyAds() async {
    try {
      final result = await restClientService.get(
        '/advertisement/mine',
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
          errorMessage: 'failed to get my advertisements',
          data: result,
        );
      }
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (e, s) {
      unawaited(
        sentToSentry(exception: e, stackTrace: s),
      );
      rethrow;
    }
  }

  @override
  Future<List<AdvertisementModel>> getBookmarkedAds() async {
    try {
      final result = await restClientService.get(
        '/advertisement/myMarked',
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
          errorMessage: 'failed to get my marked advertisements',
          data: result,
        );
      }
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
