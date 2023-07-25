import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // ---->> Login Page Controllers
  var userName = "User".obs;
  TextEditingController cont = TextEditingController();
  changeUserName(String val) {
    userName.value = val;
    val = "";
    cont.clear();
    Get.back();
    Get.toNamed("/home");
  }

  //-----> Drawer Controller
  late var userAvatarText = userName.value.toUpperCase().substring(0, 1);
  var userEmail = "exm@example.com".obs;
// ------> Drawer

// --------> Settings
  var settingsChangeThemeIcon = Icon(Icons.dark_mode).obs;
  void settingsChangeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    print("done");
  }
}
