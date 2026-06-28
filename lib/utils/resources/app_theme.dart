import 'package:a5bark/utils/resources/app_colors.dart';
import 'package:a5bark/utils/resources/app_text_style.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: LightColors.background,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: LightColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: LightColors.textPrimary,
      onError: AppColors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.background,
      foregroundColor: LightColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: LightColors.background,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: LightColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    cardColor: LightColors.card,

    dividerColor: LightColors.divider,

    iconTheme: const IconThemeData(color: LightColors.textPrimary),

    textTheme: TextTheme(
      bodyLarge: AppTextStyle.bodyLarge.copyWith(
        color: LightColors.textPrimary,
      ),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(
        color: LightColors.textPrimary,
      ),
      bodySmall: AppTextStyle.bodySmall.copyWith(
        color: LightColors.textSecondary,
      ),
      titleLarge: AppTextStyle.titleLarge.copyWith(
        color: LightColors.textPrimary,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: DarkColors.background,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: DarkColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: DarkColors.textPrimary,
      onError: AppColors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColors.background,
      foregroundColor: DarkColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DarkColors.background,
      selectedItemColor: AppColors.primaryLight,
      unselectedItemColor: DarkColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    cardColor: DarkColors.card,

    dividerColor: DarkColors.divider,

    iconTheme: const IconThemeData(color: DarkColors.textPrimary),

    textTheme: TextTheme(
      bodyLarge: AppTextStyle.bodyLarge.copyWith(color: DarkColors.textPrimary),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(
        color: DarkColors.textPrimary,
      ),
      bodySmall: AppTextStyle.bodySmall.copyWith(
        color: DarkColors.textSecondary,
      ),
      titleLarge: AppTextStyle.titleLarge.copyWith(
        color: DarkColors.textPrimary,
      ),
    ),
  );
}
