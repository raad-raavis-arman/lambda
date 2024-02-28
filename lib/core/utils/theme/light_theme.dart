import 'package:flutter/material.dart';
import 'package:landa/core/utils/theme/constant/constant.dart';

class LightTheme {

  LightTheme({required this.fontFamily});
  final String fontFamily;

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
        outlinedButtonTheme: OutlinedButtonThemeData(
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
