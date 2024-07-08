import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required this.preferences,
  }) : super(SplashInitialState()) {
    on<SplashCheckAuthEvent>((event, emit) async {
      final isUserAuthorized = preferences.isUserAuthorized();
      if (isUserAuthorized) {
        emit(SplashAuthorizedState());
      } else {
        emit(SplashNotAuthorizedState());
      }
    });
  }

  final SharedPreferences preferences;
}
