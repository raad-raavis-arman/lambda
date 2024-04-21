import 'dart:convert';

import 'package:landa/core/utils/constants/constants.dart';
import 'package:landa/screens/verify_login/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension PreferencesTokenExtension on SharedPreferences {
  UserModel? getUser() {
    final userAuthJsonString = getString(PreferenceKeys.userAuth);
    if (userAuthJsonString == null || userAuthJsonString.isEmpty) {
      return null;
    } else {
      final loginAuthModel = LoginAuthModel.fromJson(
        jsonDecode(userAuthJsonString),
      );
      return loginAuthModel.mUser;
    }
  }

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

  bool isUserAuthorized() {
    final userAuthJsonString = getString(PreferenceKeys.userAuth);
    if (userAuthJsonString == null || userAuthJsonString.isEmpty) {
      return false;
    } else {
      final loginAuthModel = LoginAuthModel.fromJson(
        jsonDecode(userAuthJsonString),
      );
      final accessToken = loginAuthModel.accessToken;
      final expiresIn = loginAuthModel.expiresIn;

      if (accessToken.isEmpty) {
        return false;
      } else {
        final expireDateTime = DateTime.parse(loginAuthModel.issuedAt).add(
          Duration(seconds: expiresIn),
        );

        if (DateTime.now().isAfter(expireDateTime)) {
          setString(PreferenceKeys.userAuth, '');
          return false;
        } else {
          return true;
        }
      }
    }
  }
}
