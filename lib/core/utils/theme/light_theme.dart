import 'package:flutter/material.dart';
import 'package:landa/core/utils/theme/constant/constant.dart';

class LightTheme {
  final String fontFamily;

  LightTheme({required this.fontFamily});

  ThemeData get data => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: fontFamily,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
      );
}
