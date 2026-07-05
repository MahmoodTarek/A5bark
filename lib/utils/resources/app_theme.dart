import 'package:a5bark/utils/resources/app_colors.dart';
import 'package:a5bark/utils/resources/app_text_style.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final ThemeData lightTheme = _buildTheme(
    const LightColors(),
    Brightness.light,
  );

  static final ThemeData darkTheme = _buildTheme(
    const DarkColors(),
    Brightness.dark,
  );

  static ThemeData _buildTheme(
      AppColors colors,
      Brightness brightness,
      ) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,

      scaffoldBackgroundColor: colors.background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.textPrimary,
        onPrimary: colors.background,
        secondary: colors.textSecondary,
        onSecondary: colors.background,
        error: Colors.red,
        onError: Colors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        centerTitle: true,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.background,
        selectedItemColor: colors.background,
        unselectedItemColor: colors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      cardColor: colors.card,
      dividerColor: colors.divider,

      iconTheme: IconThemeData(
        color: colors.icon,
      ),

      textTheme: TextTheme(
        bodyLarge: AppTextStyle.bodyLarge.copyWith(
          color: colors.textPrimary,
        ),
        bodyMedium: AppTextStyle.bodyMedium.copyWith(
          color: colors.textPrimary,
        ),
        bodySmall: AppTextStyle.bodySmall.copyWith(
          color: colors.textSecondary,
        ),
        titleLarge: AppTextStyle.titleLarge.copyWith(
          color: colors.textPrimary,
        ),
      ),
    );
  }
}