part of 'otp_timer_bloc.dart';

final class OtpTimerState extends Equatable {
  const OtpTimerState({
    this.timerFinished = true,
    this.remainedTimeInSecond = 0,
    this.remainedTimeFormattedString = '00:00',
  });

  final bool timerFinished;
  final int remainedTimeInSecond;
  final String remainedTimeFormattedString;

  @override
  List<Object> get props => [
        timerFinished,
        remainedTimeInSecond,
        remainedTimeFormattedString,
      ];
}
