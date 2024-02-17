import 'package:flutter/material.dart';

class LightTheme {
  final String fontFamily;

  LightTheme({required this.fontFamily});

  ThemeData get data => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: fontFamily,
      );
}
