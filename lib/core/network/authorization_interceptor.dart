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
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      preferences.setString(PreferenceKeys.userAuth, '');
    }
    super.onResponse(response, handler);
  }
}
