import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/screens/login/domain/usecases/usecases.dart';
import 'package:landa/screens/verify_login/domain/usecases/usecases.dart';

part 'verify_login_event.dart';
part 'verify_login_state.dart';

final class VerifyLoginBloc extends Bloc<VerifyLoginEvent, VerifyLoginState> {
  VerifyLoginBloc({
    required this.userOtpUsescase,
    required this.userLoginUsescase,
  }) : super(VerifyLoginInitialState()) {
    on<AuthenticateLoginEvent>(_onAuthenticateLogin);
    on<ResendOtpEvent>(_onResendOtp);
  }

  final UserOtpUsescase userOtpUsescase;
  final UserLoginUsescase userLoginUsescase;

  Future<void> _onAuthenticateLogin(
    AuthenticateLoginEvent event,
    Emitter<VerifyLoginState> emit,
  ) async {
    final result = await userLoginUsescase.call(
      LoginParam(
        mobileNumber: event.mobileNumber,
        otpCode: event.otp,
      ),
    );
    result.fold(
      (l) => emit(VerifyLoginFailState(message: l.message)),
      (r) => emit(
        VerifyLoginSuccessState(),
      ),
    );
  }

  Future<void> _onResendOtp(
    ResendOtpEvent event,
    Emitter<VerifyLoginState> emit,
  ) async {
    final result = await userOtpUsescase.call(
      OtpParam(
        mobileNumber: event.mobileNumber,
      ),
    );
    result.fold(
      (l) => emit(VerifyLoginOtpFailState(message: l.message)),
      (r) => emit(
        VerifyLoginOtpSuccessState(),
      ),
    );
  }
}
