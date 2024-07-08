import 'package:flutter/material.dart';

class DarkTheme {
  DarkTheme({required this.fontFamily});
  final String fontFamily;

  ThemeData get data => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: fontFamily,
        indicatorColor: const Color(0xFF006A6A),
      );
}
