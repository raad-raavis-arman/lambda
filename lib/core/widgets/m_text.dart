import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';

class MText extends StatelessWidget {
  const MText({
    required this.text,
    this.locale,
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textSpan,
  });

  final String text;
  final Locale? locale;

  final InlineSpan? textSpan;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;

  final TextScaler? textScaler;
  final int? maxLines;

  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) {
    final mLocale = locale ?? Localizations.localeOf(context);
    final translatedText = mLocale.languageCode == 'fa'
        ? text.replaceEnNumToFa()
        : text.replaceFaNumToEn();
    return Text(
      translatedText,
      key: key,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: mLocale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}
