part of 'verify_login_bloc.dart';

sealed class VerifyLoginEvent extends Equatable {}

final class AuthenticateLoginEvent extends VerifyLoginEvent {
  final String otp;
  final String mobileNumber;

  AuthenticateLoginEvent({required this.otp, required this.mobileNumber});

  @override
  List<Object?> get props => [
        otp,
        mobileNumber,
      ];
}

final class ResendOtpEvent extends VerifyLoginEvent {
  final String otp;

  ResendOtpEvent({required this.otp});

  @override
  List<Object?> get props => [
        otp,
      ];
}
