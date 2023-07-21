import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()=> runApp(
  GetMaterialApp(
debugShowCheckedModeBanner: false,
home: const LogIn(),
  ),
);
class LogIn extends StatelessWidget{
  const LogIn({super.key});
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Route: LogIn")),
        actions: [
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
