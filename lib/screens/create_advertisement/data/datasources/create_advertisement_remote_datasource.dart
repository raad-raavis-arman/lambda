import 'dart:async';

import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/exceptions/exceptions.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/create_advertisement/data/datasources/datasources.dart';
import 'package:landa/screens/create_advertisement/data/models/models.dart';

class CreateAdvertisementRemoteDatasource
    implements CreateAdvertisementDatasource {
  CreateAdvertisementRemoteDatasource({
    required this.restClientService,
  });

  final RestClientService restClientService;
  @override
  Future<bool> create(CreateAdvertisementModel createAdvertisementModel) async {
    try {
      final response = await restClientService.post(
        '/advertisement',
        data: createAdvertisementModel.toJson(),
      );
      return response['success'];
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
