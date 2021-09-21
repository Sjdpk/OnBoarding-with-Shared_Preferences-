import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_register/onboard/onboard_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == screens.length - 1;

  storeOnboardInfo() async {
    // ignore: avoid_print
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    // ignore: avoid_print
    print(prefs.getInt('onBoard'));
  }

  forwardAction(Widget homePage) {
    if (isLastPage) {
      storeOnboardInfo();
      Get.off(() => homePage);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardModel> screens = [
    OnBoardModel('assets/images/img-1.png', 'Hello', 'Description'),
    OnBoardModel('assets/images/img-2.png', 'Hello', 'Description'),
    OnBoardModel('assets/images/img-3.png', 'Hello', 'Description'),
  ];
}

// ignore: unused_element

