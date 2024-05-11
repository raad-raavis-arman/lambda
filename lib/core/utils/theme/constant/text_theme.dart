import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';

TextTheme textTheme(BuildContext context) => TextTheme(
      displayLarge: TextStyle(
        fontSize: context.rW(36),
        fontWeight: FontWeight.w900,
      ),
      displayMedium: TextStyle(
        fontSize: context.rW(34),
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontSize: context.rW(30),
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        fontSize: context.rW(26),
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontSize: context.rW(24),
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: context.rW(22),
        fontWeight: FontWeight.normal,
      ),
      titleLarge: TextStyle(
        fontSize: context.rW(20),
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: context.rW(18),
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: context.rW(16),
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontSize: context.rW(14),
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: context.rW(12),
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: context.rW(10),
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: context.rW(14),
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontSize: context.rW(12),
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: context.rW(10),
        fontWeight: FontWeight.normal,
      ),
    );
