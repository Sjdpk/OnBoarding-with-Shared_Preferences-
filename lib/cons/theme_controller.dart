import 'package:shared_preferences/shared_preferences.dart';

class ThemeController {
  setDarkTheme() async {
    int isDark = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('isDark', isDark);
  }

  setLightTheme() async {
    int isDark = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('isDark', isDark);
  }
}
