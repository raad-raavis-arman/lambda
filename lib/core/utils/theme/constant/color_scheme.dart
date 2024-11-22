import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006A6A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF6FF7F6),
  onPrimaryContainer: Color(0xFF002020),
  secondary: Color(0xFF4A6363),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCCE8E7),
  onSecondaryContainer: Color(0xFF051F1F),
  tertiary: Color(0xFF006398),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFCDE5FF),
  onTertiaryContainer: Color(0xFF001D32),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFAFDFC),
  onSurface: Color(0xFF191C1C),
  surfaceContainerHighest: Color(0xFFDAE5E4),
  onSurfaceVariant: Color(0xFF3F4948),
  outline: Color(0xFF6F7979),
  onInverseSurface: Color(0xFFEFF1F0),
  inverseSurface: Color(0xFF2D3131),
  inversePrimary: Color(0xFF4CDADA),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006A6A),
  outlineVariant: Color(0xFFBEC9C8),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF4CDADA),
  onPrimary: Color(0xFF003737),
  primaryContainer: Color(0xFF004F50),
  onPrimaryContainer: Color(0xFF6FF7F6),
  secondary: Color(0xFFB0CCCB),
  onSecondary: Color(0xFF1B3534),
  secondaryContainer: Color(0xFF324B4B),
  onSecondaryContainer: Color(0xFFCCE8E7),
  tertiary: Color(0xFF94CCFF),
  onTertiary: Color(0xFF003352),
  tertiaryContainer: Color(0xFF004B74),
  onTertiaryContainer: Color(0xFFCDE5FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF191C1C),
  onSurface: Color(0xFFE0E3E2),
  surfaceContainerHighest: Color(0xFF3F4948),
  onSurfaceVariant: Color(0xFFBEC9C8),
  outline: Color(0xFF889392),
  onInverseSurface: Color(0xFF191C1C),
  inverseSurface: Color(0xFFE0E3E2),
  inversePrimary: Color(0xFF006A6A),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4CDADA),
  outlineVariant: Color(0xFF3F4948),
  scrim: Color(0xFF000000),
);

extension ColorX on ColorScheme {
  MaterialColor get warningColor => const MaterialColor(
        0xFFFFBF00,
        <int, Color>{
          50: Color(0xFFFFF8E1), // 10%
          100: Color(0xFFFFE0B2), // 20%
          200: Color(0xFFFFCC80), // 30%
          300: Color(0xFFFFB74D), // 40%
          400: Color(0xFFFFA726), // 50%
          500: Color(0xFFFFBF00), // 60%
          600: Color(0xFFFFA000), // 70%
          700: Color(0xFFFF8F00), // 80%
          800: Color(0xFFFF6F00), // 90%
          900: Color(0xFFFFD740), // 100%
        },
      );
  MaterialColor get errorColor => const MaterialColor(
        0xFFC7220A,
        {
          50: Color(0xFFF9E9E7),
          100: Color(0xFFEEBAB3),
          200: Color(0xFFE5998E),
          300: Color(0xFFD96B5B),
          400: Color(0xFFD24E3B),
          500: Color(0xFFC7220A),
          600: Color(0xFF8D1807),
          700: Color(0xFF8D1807),
          800: Color(0xFF6D1306),
          900: Color(0xFF540E04),
        },
      );

  MaterialColor get successColor => const MaterialColor(
        0xFF0EA45F,
        {
          50: Color(0xFFE7F6EF),
          100: Color(0xFFB4E3CD),
          200: Color(0xFF90D5B5),
          300: Color(0xFF5EC294),
          400: Color(0xFF3EB67F),
          500: Color(0xFF0EA45F),
          600: Color(0xFF0D9556),
          700: Color(0xFF0A7443),
          800: Color(0xFF085A34),
          900: Color(0xFF064528),
        },
      );
}
