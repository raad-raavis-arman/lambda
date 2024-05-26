part of 'verify_login_bloc.dart';

sealed class VerifyLoginState extends Equatable {
  const VerifyLoginState();
  @override
  List<Object?> get props => [];
}

final class VerifyLoginInitialState extends VerifyLoginState {}

final class VerifyLoginLoadingState extends VerifyLoginState {}

final class VerifyLoginSuccessState extends VerifyLoginState {}

final class VerifyLoginOtpSuccessState extends VerifyLoginState {}

final class VerifyLoginFailState extends VerifyLoginState {
  const VerifyLoginFailState({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

final class VerifyLoginOtpFailState extends VerifyLoginState {
  const VerifyLoginOtpFailState({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
