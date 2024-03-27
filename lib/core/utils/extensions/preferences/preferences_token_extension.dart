import 'dart:convert';

import 'package:landa/core/utils/constants/constants.dart';
import 'package:landa/screens/verify_login/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension PreferencesTokenExtension on SharedPreferences {
  String? getAuthorizationToken() {
    final userAuthJsonString = getString(PreferenceKeys.userAuth);
    if (userAuthJsonString == null || userAuthJsonString.isEmpty) {
      return null;
    } else {
      final loginAuthModel = LoginAuthModel.fromJson(
        jsonDecode(userAuthJsonString),
      );
      final accessToken = loginAuthModel.accessToken;
      final tokenType = loginAuthModel.tokenType;
      return '$tokenType $accessToken';
    }
  }
}
