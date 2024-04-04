import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/home/data/datasources/datasources.dart';
import 'package:landa/screens/home/data/models/advertisement_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRemoteDatasource implements HomeDatasource {
  const HomeRemoteDatasource({
    required this.preferences,
    required this.restClientService,
  });

  final RestClientService restClientService;
  final SharedPreferences preferences;
  @override
  Future<List<AdvertisementModel>> getAllAds({
    required int offset,
    required int limit,
  }) async {
    try {
      final authorization = preferences.getAuthorizationToken();
      final result = await restClientService.get(
        '/advertisement',
        queryParameters: {
          'offset': offset,
          'limit': limit,
        },
        options: Options(
          headers: {
            'Authorization': authorization,
          },
        ),
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
    } on Exception catch (_) {
      rethrow;
    }
  }
}
