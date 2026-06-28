import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.system;

  void changeTheme({required ThemeMode newThemeMode}) {
    if (newThemeMode == currentTheme) return;
    currentTheme = newThemeMode;
    notifyListeners();
  }
}
