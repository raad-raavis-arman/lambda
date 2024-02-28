part of 'lang_bloc.dart';

final class LangState extends Equatable {

  const LangState({required this.locale});
  final Locale locale;

  bool get isPersian => locale.languageCode == 'fa';

  @override
  List<Object> get props => [locale];
}
