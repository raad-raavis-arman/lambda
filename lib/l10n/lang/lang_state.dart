part of 'lang_bloc.dart';

final class LangState extends Equatable {
  final Locale locale;

  const LangState({required this.locale});

  bool get isPersian => locale.languageCode == 'fa';

  @override
  List<Object> get props => [locale];
}
