import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controls.dart';
import 'drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(context) {
    final Controller c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Obx(() => Text("Home: ${c.userName}"))),
        actions: [
          IconButton(
            tooltip: "Theme",
            onPressed: () {
              c.settingsChangeTheme();},
            icon:Obx(() => c.settingsChangeThemeIcon.value), //Icon
          ), // IconButton
        ],
      ),
      body: Center(child: Column()),
      drawer: AppDrawer(),
    );
  }
}
