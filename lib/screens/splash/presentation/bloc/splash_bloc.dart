import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/verify_login/data/models/login_auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required this.preferences,
  }) : super(SplashInitialState()) {
    on<SplashCheckAuthEvent>((event, emit) {
      final userAuthJsonString = preferences.getString(PreferenceKeys.userAuth);
      if (userAuthJsonString == null) {
        emit(SplashNotAuthorizedState());
      } else {
        final loginAuthModel = LoginAuthModel.fromJson(
          jsonDecode(userAuthJsonString),
        );
        final accessToken = loginAuthModel.accessToken;
        final expiresIn = loginAuthModel.expiresIn;

        if (accessToken.isEmpty) {
          emit(SplashNotAuthorizedState());
        } else {
          final expireDateTime = DateTime.parse(loginAuthModel.issuedAt).add(
            Duration(seconds: expiresIn),
          );

          if (DateTime.now().isAfter(expireDateTime)) {
            emit(SplashNotAuthorizedState());
          } else {
            emit(SplashAuthorizedState());
          }
        }
      }
    });
  }

  final SharedPreferences preferences;
}
