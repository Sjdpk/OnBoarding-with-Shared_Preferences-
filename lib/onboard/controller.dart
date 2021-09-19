import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_register/onboard/onboard_model.dart';
import 'package:get/get.dart';

class OnBoardController extends GetxController {
  var selectedPageIndex = 0.obs;
  List<OnBoardModel> screens = [
    OnBoardModel('assets/images/img-1.png', 'Hello', 'Description'),
    OnBoardModel('assets/images/img-2.png', 'Hello', 'Description'),
    OnBoardModel('assets/images/img-3.png', 'Hello', 'Description'),
  ];
}

// ignore: unused_element

