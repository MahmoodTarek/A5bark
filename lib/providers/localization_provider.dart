import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale? currentLocale = Locale('en');

  void changeLocale(Locale newLocale) {
    if (currentLocale == newLocale) return;
    currentLocale = newLocale;
    notifyListeners();
  }
}
