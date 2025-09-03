import 'package:flutter/material.dart';

/// Central place for colors, text styles, etc.
class AppTheme {
  // Brand primary color (#2b4b83)
  static const Color primary = Color(0xFF2B4B83);

  // Shared grey color (#000000A6)
  static const Color textGreyA6 = Color(0xA6000000);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: false, // Stable look with Material 2 widgets
      primaryColor: primary,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
      ),
      // Button style defaults (we’ll override pressed state per spec)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(primary),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 14),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
