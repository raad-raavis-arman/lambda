import 'package:dio/dio.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor({required this.preferences});

  final SharedPreferences preferences;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authToken = preferences.getAuthorizationToken();
    options.headers.addAll({'Authorization': authToken});
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      preferences.setString(PreferenceKeys.userAuth, '');
    }
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      preferences.setString(PreferenceKeys.userAuth, '');
    }
    handler.next(response);
  }
}
