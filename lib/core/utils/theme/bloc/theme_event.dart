part of 'theme_bloc.dart';

final class ThemeEvent extends Equatable {
  final ThemeMode mode;

  const ThemeEvent({required this.mode});

  @override
  List<Object?> get props => [mode];
}
