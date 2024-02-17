import 'package:flutter/material.dart';

class DarkTheme {
  const DarkTheme._();

  static final data = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.black,
  );
}
