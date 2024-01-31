import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landa/screens/login/domain/usecases/usecases.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.userOtp,
  }) : super(LoginInitialState()) {
    on<SendOtpEvent>(_onSendOtpEvent);
  }

  final UserOtpUsescase userOtp;

  Future<void> _onSendOtpEvent(
    SendOtpEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginProgressState());
    final response =
        await userOtp.call(OtpParam(mobileNumber: event.mobileNumber));
    response.fold(
      (failure) => emit(LoginFailureState()),
      (otp) => emit(LoginOtpSentState()),
    );
  }
}
