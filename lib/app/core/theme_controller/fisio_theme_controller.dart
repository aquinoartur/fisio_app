import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FisioThemeController extends ChangeNotifier {
  ValueNotifier<bool> theme = ValueNotifier(false);

  bool get isDark => theme.value;

  late SharedPreferences themePreferences;

  Future<void> loadThemeMode() async {
    themePreferences = await SharedPreferences.getInstance();
    bool themeMode = themePreferences.getBool('themeMode') ?? false;
    theme.value = themeMode;
    notifyListeners();
  }

  Future<void> setThemeMode() async {
    theme.value = !theme.value;
    notifyListeners();
    themePreferences = await SharedPreferences.getInstance();
    await themePreferences.setBool('themeMode', theme.value);
  }
}
