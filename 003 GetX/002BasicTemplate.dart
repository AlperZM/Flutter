import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() =>
    runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: Home()));

class Controller extends GetxController {
  bool isDark = false;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Change Theme")),
        actions: [
          IconButton(
            tooltip: "Settings",
            icon: const Icon(
              Icons.settings_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            tooltip: "Theme",
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            icon: const Icon(
              Icons.model_training_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
