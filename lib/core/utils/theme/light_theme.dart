import 'package:flutter/material.dart';
import 'package:landa/core/utils/theme/constant/constant.dart';

class LightTheme {
  LightTheme({
    required this.fontFamily,
  });
  final String fontFamily;

  ThemeData get data => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: fontFamily,
        colorScheme: lightColorScheme,
        indicatorColor: const Color(0xFF006A6A),
        textTheme: textTheme,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Color(0xFFE8F5E9)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
