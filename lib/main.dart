import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboard/onboard.dart';

int? isViewed;
int? isDark;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  isDark = prefs.getInt('isDark');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark != 0 ? ThemeData.dark() : ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      // Theme mode depends on device settings at the beginning
      home: isViewed != 0 ? OnBoardScreen() : MainScreen(),
    );
  }
}
