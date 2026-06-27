import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF1D4ED8);

  static const Color secondary = Color(0xFF06B6D4);
  static const Color accent = Color(0xFFF97316);

  // Status Colors
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
}

abstract final class LightColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8FAFC);
  static const Color card = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);

  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFE2E8F0);

  static const Color icon = Color(0xFF374151);
}

abstract final class DarkColors {
  static const Color background = Color(0xFF171717);
  static const Color surface = Color(0xFF262626);
  static const Color card = Color(0xFF2D2D2D);

  static const Color textPrimary = Color(0xFFF9FAFB);
  static const Color textSecondary = Color(0xFF9CA3AF);

  static const Color border = Color(0xFF404040);
  static const Color divider = Color(0xFF3F3F46);

  static const Color icon = Color(0xFFE5E7EB);
}