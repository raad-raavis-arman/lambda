import 'package:devicelocale/devicelocale.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landa/l10n/l10n.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(const LangState(locale: Locale('fa'))) {
    on<LangFetchLocalEvent>((event, emit) async {
      final Locale? locale = await Devicelocale.currentAsLocale;

      final langauageCode = locale!.languageCode;
      if (L10n.all.contains(Locale(langauageCode))) {
        emit(LangState(locale: locale));
      }
    });
  }
}
