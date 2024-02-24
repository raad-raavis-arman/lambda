part of 'otp_timer_bloc.dart';

sealed class OtpTimerEvent extends Equatable {
  const OtpTimerEvent();

  @override
  List<Object> get props => [];
}

final class OtpTimerStartEvent extends OtpTimerEvent {}

final class OtpTimerUpdatetEvent extends OtpTimerEvent {}
