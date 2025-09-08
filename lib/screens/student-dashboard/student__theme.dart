// ============================
// file: lib/styles/app_theme.dart
// A small style system so EVERY text uses size & color
// ============================
import 'package:flutter/material.dart';

class StudentAppColors {
  StudentAppColors._();
  static const background = Color(0xFFF7F8FA);
  static const surface = Colors.white;
  static const primary = Color(0xFF0D6EFD);
  static const primaryDark = Color(0xFF0A58CA);
  static const textPrimary = Color(0xFF0F172A); // slate-900
  static const textSecondary = Color(0xFF475569); // slate-600
  static const divider = Color(0xFFE2E8F0); // slate-200
  static const chip = Color(0xFFEEF2FF);
  static const success = Color(0xFF16A34A);
}

class StudentAppTextStyles {
  StudentAppTextStyles._();

  // Headlines
  static const h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: StudentAppColors.textPrimary,
  );
  static const h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: StudentAppColors.textPrimary,
  );

  // Body
  static const body = TextStyle(
    fontSize: 14,
    color: StudentAppColors.textPrimary,
  );
  static const bodyMuted = TextStyle(
    fontSize: 13,
    color: StudentAppColors.textSecondary,
  );

  // Labels
  static const label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: StudentAppColors.textSecondary,
  );
  static const value = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: StudentAppColors.textPrimary,
  );

  static const chip = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: StudentAppColors.primaryDark,
  );
}
