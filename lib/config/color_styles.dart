import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryGradientColor1 = Color(0xFFC20EA1);
  static const primaryGradientColor2 = Color(0xFFDD2D7F);
  static const primaryGradientColor3 = Color(0xFFEE4C5E);
  static const primaryGradientColor4 = Color(0xFFF46D41);

  static List<Color> primaryGradient = [
    primaryGradientColor1,
    primaryGradientColor2,
    primaryGradientColor3,
    primaryGradientColor4,
  ];

  static List<Color> primaryGradientRev = [
    primaryGradientColor4,
    primaryGradientColor3,
    primaryGradientColor2,
    primaryGradientColor1,
  ];

  static const background = Color(0xFF000000);

  static const darkSurface100 = Color(0xFF121212);
  static const darkSurface200 = Color(0xFF282828);
  static const darkSurface400 = Color(0xFF575757);

  static const lightSurface400 = Color(0xFFB3B3B3);
  static const lightSurface500 = Color(0xFF999999);
  static const lightSurface600 = Color(0xFF808080);

  static const ColorScheme colorSchemeDark = ColorScheme(
      brightness: Brightness.dark,
      primary: primaryGradientColor1,
      onPrimary: Colors.white,
      secondary: primaryGradientColor4,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: background,
      onBackground: Colors.white,
      surface: darkSurface200,
      onSurface: Colors.white);
}
