import 'package:flutter/material.dart';

abstract interface class AppColors {
  Color get background;

  Color get surface;

  Color get card;

  Color get textPrimary;

  Color get textSecondary;

  Color get border;

  Color get divider;

  Color get icon;

  Color get transparent;
}

final class LightColors implements AppColors {
  const LightColors();

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get surface => const Color(0xFFF8FAFC);

  @override
  Color get card => const Color(0xFFFFFFFF);

  @override
  Color get textPrimary => const Color(0xFF111827);

  @override
  Color get textSecondary => const Color(0xFF6B7280);

  @override
  Color get border => const Color(0xFFE5E7EB);

  @override
  Color get divider => const Color(0xFFE2E8F0);

  @override
  Color get icon => const Color(0xFF374151);
}

final class DarkColors implements AppColors {
  const DarkColors();

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get background => const Color(0xFF171717);

  @override
  Color get surface => const Color(0xFF262626);

  @override
  Color get card => const Color(0xFF2D2D2D);

  @override
  Color get textPrimary => const Color(0xFFF9FAFB);

  @override
  Color get textSecondary => const Color(0xFF9CA3AF);

  @override
  Color get border => const Color(0xFF404040);

  @override
  Color get divider => const Color(0xFF3F3F46);

  @override
  Color get icon => const Color(0xFFE5E7EB);
}

