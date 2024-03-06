import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_timer_event.dart';
part 'otp_timer_state.dart';

class OtpTimerBloc extends Bloc<OtpTimerEvent, OtpTimerState> {
  OtpTimerBloc() : super(const OtpTimerState()) {
    on<OtpTimerStartEvent>((event, emit) {
      if (_timer == null) {
        emit(
          OtpTimerState(
            timerFinished: false,
            remainedTimeFormattedString: '02:00',
            remainedTimeInSecond: _remainedTimeSeconds,
          ),
        );
        _timer = Timer.periodic(const Duration(seconds: 1), (_) {
          _currentState = _onTimerTick();
          add(OtpTimerUpdatetEvent());
        });
      }
    });

    on<OtpTimerUpdatetEvent>((event, emit) => emit(_currentState));
  }

  Timer? _timer;
  final _totalTimeDurationInSecond = 2 * 60;
  int _remainedTimeSeconds = 2 * 60;
  OtpTimerState _currentState = const OtpTimerState();

  OtpTimerState _onTimerTick() {
    if (_remainedTimeSeconds > 0) {
      _remainedTimeSeconds -= 1;
      final seconds = _remainedTimeSeconds % 60;
      final minutes = _remainedTimeSeconds ~/ 60;
      return OtpTimerState(
        timerFinished: false,
        remainedTimeInSecond: _remainedTimeSeconds,
        remainedTimeFormattedString: '${minutes.toString().padLeft(2, '0')}'
            ':${seconds.toString().padLeft(2, '0')}',
      );
    } else {
      _timer?.cancel();
      _timer = null;
      _remainedTimeSeconds = _totalTimeDurationInSecond;
      return const OtpTimerState();
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
