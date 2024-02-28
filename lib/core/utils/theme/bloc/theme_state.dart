part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  const ThemeState({required this.mode});
  final ThemeMode mode;

  @override
  List<Object?> get props => [mode];
}
