import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:language_code/language_code.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(const LangState(locale: Locale('fa'))) {
    on<LangFetchLocalEvent>((event, emit) async {
      final Locale locale = LanguageCode.locale;

      final langauageCode = locale.languageCode;
      if (L10n.all.contains(Locale(langauageCode))) {
        emit(LangState(locale: locale));
      }
    });
  }
}
