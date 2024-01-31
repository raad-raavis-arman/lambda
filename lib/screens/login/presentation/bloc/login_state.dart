part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitialState extends LoginState {}

final class LoginProgressState extends LoginState {}

final class LoginOtpSentState extends LoginState {}

final class LoginFailureState extends LoginState {}
