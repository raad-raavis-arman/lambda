part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class SendOtpEvent extends LoginEvent {
  const SendOtpEvent({required this.mobileNumber});
  final String mobileNumber;

  @override
  List<Object> get props => [mobileNumber];
}
