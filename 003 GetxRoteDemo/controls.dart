import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';

class Controller extends GetxController {

  // ---->> Login Page Controllers
  var userName = "User".obs;
  TextEditingController cont = TextEditingController();
  changeUserName(String val) {
    userName.value = val;
    val = "";
    cont.clear();
    Get.toNamed("/home.dart");
  }
  // ----> end of the login page controllers
}
