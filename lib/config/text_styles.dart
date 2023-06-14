import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Contain all text styles of the project
class AppTextStyles {
  AppTextStyles._();

  static final textTheme = GoogleFonts.lexendTextTheme();

  static TextStyle t10(
      {Color? color = Colors.white,
        FontWeight fontWeight = FontWeight.w300,
        TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: 10,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  static TextStyle t14(
      {Color? color = Colors.white,
        FontWeight fontWeight = FontWeight.w400,
        TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: 14,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  static TextStyle t16(
      {Color? color = Colors.white,
      FontWeight fontWeight = FontWeight.w500,
      TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: 16,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  static TextStyle t12(
      {Color? color = Colors.white,
        FontWeight fontWeight = FontWeight.w400,
        TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: 12,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  static TextStyle t32(
      {Color? color = Colors.white,
        FontWeight fontWeight = FontWeight.w600,
        TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: 32,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }
}
