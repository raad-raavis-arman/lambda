import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  ) async {}
  
  Future<void> _onResendOtp(
    ResendOtpEvent event,
    Emitter<VerifyLoginState> emit,
  ) async {}
}
