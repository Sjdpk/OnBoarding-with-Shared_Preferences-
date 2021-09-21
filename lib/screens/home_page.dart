import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/cons/theme_controller.dart';
// import 'package:login_register/cons/theme_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _themeCOntroller = ThemeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            onPressed: () {
              if (Get.isDarkMode) {
                _themeCOntroller.setLightTheme();
                Get.changeTheme(ThemeData.light());
              } else {
                _themeCOntroller.setDarkTheme();
                Get.changeTheme(ThemeData.dark());
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to Home page'),
      ),
    );
  }
}
