import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          const ThemeState(mode: ThemeMode.system),
        ) {
    on<ThemeEvent>((event, emit) {
      emit(const ThemeState(mode: ThemeMode.light));
      // TODO(Taleb): uncomment below code after settings page created
      //emit(ThemeState(mode: event.mode));
    });
  }
}
