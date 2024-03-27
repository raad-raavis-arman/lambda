import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/create_advertisement/data/datasources/datasources.dart';
import 'package:landa/screens/create_advertisement/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAdvertisementRemoteDatasource
    implements CreateAdvertisementDatasource {
  CreateAdvertisementRemoteDatasource({
    required this.restClientService,
    required this.preferences,
  });

  final RestClientService restClientService;
  final SharedPreferences preferences;
  @override
  Future<bool> create(CreateAdvertisementModel createAdvertisementModel) async {
    try {
      final authorizationToken = preferences.getAuthorizationToken();
      final response = await restClientService.post(
        '/advertisement',
        options: Options(
          headers: {
            'Authorization': authorizationToken,
          },
        ),
        data: createAdvertisementModel.toJson(),
      );
      return response['success'];
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
