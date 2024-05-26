part of 'theme_bloc.dart';

final class ThemeEvent extends Equatable {
  const ThemeEvent({required this.mode});
  final ThemeMode mode;

  @override
  List<Object?> get props => [mode];
}
