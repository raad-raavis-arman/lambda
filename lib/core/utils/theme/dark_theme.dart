import 'package:flutter/material.dart';

class DarkTheme {
  final String fontFamily;

  DarkTheme({required this.fontFamily});

  ThemeData get data => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: fontFamily,
      );
}
