import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controls.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),//GetMaterialApp
    );

class Home extends StatelessWidget{
  const Home({super.key});
  @override
  Widget build(context){
    final Controller c = Get.put(Controller());
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
            ),//Icon
          ),// IconButton
        ],
      ),
    body: Center(child: Column(
      
    )),
    );
  }
}
