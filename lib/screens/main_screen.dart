import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/cons/theme_controller.dart';
import 'package:login_register/screens/home_page.dart';

class MainScreen extends StatelessWidget {
  final NavController navController = Get.put(NavController());
  final _themeCOntroller = ThemeController();

  final List<Widget> bodyContent = [
    // Text("Home"),
    const HomePage(),
    const Text("Contacts"),
    const Text("Messages"),
    const Text("Info"),
  ];

  MainScreen({Key? key}) : super(key: key);
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
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(navController.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Info",
            ),
          ],
          currentIndex: navController.selectedIndex,
          onTap: (index) => navController.selectedIndex = index,
        ),
      ),
    );
  }
}

class NavController extends GetxController {
  final _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
}
