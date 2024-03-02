import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';

class MText extends Text {
  const MText(
    this.context,
    this.text, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(text);

  final BuildContext context;
  final String text;

  @override
  String? get data {
    if (context.read<LangBloc>().state.isPersian) {
      return text.replaceEnNumToFa();
    } else {
      return text.replaceFaNumToEn();
    }
  }
}
