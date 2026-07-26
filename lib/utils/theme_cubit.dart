import 'package:a5bark/data/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({required ThemeMode initialTheme}) : super(initialTheme);

  Future<void> changeTheme({required ThemeMode newThemeMode}) async {
    if (newThemeMode == state) return;

    await AppLaunchService.setTheme(
      isDarkTheme: newThemeMode == ThemeMode.dark,
    );

    emit(newThemeMode);
  }
}
