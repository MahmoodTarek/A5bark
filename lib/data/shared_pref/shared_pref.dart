import 'package:a5bark/utils/resources/app_shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLaunchService {
  static Future<bool> isDarkTheme() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(AppSharedPrefKey.isDarkTheme) ?? true;
  }

  static Future<void> setTheme({required bool isDarkTheme}) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setBool(AppSharedPrefKey.isDarkTheme, isDarkTheme);
  }
}
