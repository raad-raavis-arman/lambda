part of 'lang_bloc.dart';

final class LangState extends Equatable {
  final Locale locale;

  const LangState({required this.locale});

  @override
  List<Object> get props => [locale];
}
