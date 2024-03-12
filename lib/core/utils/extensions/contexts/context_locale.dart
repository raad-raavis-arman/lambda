import 'package:flutter/material.dart';

extension ContextLocale on BuildContext {
  
  bool get isPersian => Localizations.localeOf(this).languageCode == 'fa';
}
