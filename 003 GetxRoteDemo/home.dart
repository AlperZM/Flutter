import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controls.dart';
import 'drawer.dart';
//After login screen
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
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            icon: const Icon(
              Icons.model_training_outlined,
            ), //Icon
          ), // IconButton
        ],
      ),
      body: Center(child: Column()),
      drawer: AppDrawer(),
    );
  }
}
