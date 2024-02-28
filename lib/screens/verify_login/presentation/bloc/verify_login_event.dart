part of 'verify_login_bloc.dart';

sealed class VerifyLoginEvent extends Equatable {}

final class AuthenticateLoginEvent extends VerifyLoginEvent {

  AuthenticateLoginEvent({required this.otp, required this.mobileNumber});

  final String otp;
  final String mobileNumber;

  @override
  List<Object?> get props => [
        otp,
        mobileNumber,
      ];
}

final class ResendOtpEvent extends VerifyLoginEvent {

  ResendOtpEvent({required this.mobileNumber});
  
  final String mobileNumber;

  @override
  List<Object?> get props => [
        mobileNumber,
      ];
}
