import 'dart:async';

import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/exceptions/exceptions.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/core/utils/constants/constants.dart';
import 'package:landa/screens/profile/data/datasources/datasources.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ProfileRemoteDatasource implements ProfileDatasource {
  ProfileRemoteDatasource({
    required this.sharedPreferences,
    required this.restClientService,
  });

  final SharedPreferences sharedPreferences;
  final RestClientService restClientService;

  @override
  Future<bool> signout() async {
    try {
      final response = await restClientService.post(
        '/auth/logout',
      );
      final isSignedOut = response['success'];
      if (isSignedOut) {
        await sharedPreferences.remove(PreferenceKeys.userAuth);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await sharedPreferences.remove(PreferenceKeys.userAuth);
        return true;
      } else {
        throw MException.fromDioError(e);
      }
    } on Exception catch (e, s) {
      unawaited(
        sentToSentry(exception: e, stackTrace: s),
      );
      rethrow;
    }
  }
}
