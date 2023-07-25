import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controls.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Obx(() => Text("Settings: ${c.userName}"))),
        actions: [
          IconButton(
            tooltip: "Theme",
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            icon: const Icon(
              Icons.model_training_outlined,
            ), //Icon
          ), // IconButton
        ],
      ),//AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Change Theme: "),
                const SizedBox(width: 20),
                IconButton(
                  icon: Obx(() => c.settingsChangeThemeIcon.value),
                  onPressed: () {
                    c.settingsChangeTheme();
                  },
                ),//IconButton
              ],//Widget
            ),//Row
          ],//Widget 
        ),//Column
      ),//Center
    );//Scaffold
  }
}
