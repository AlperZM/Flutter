import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // ---->> Login Page Controllers
  var userName = "User".obs;
  TextEditingController _controller = TextEditingController();
  changeUserName(String val) {
    userName.value = val;
    val = "";
    _controller.clear();
  }
  // ----> end of the login page controllers
}
