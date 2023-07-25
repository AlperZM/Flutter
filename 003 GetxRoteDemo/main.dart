import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controls.dart';
import "home.dart";
import 'settings.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
// ----> Set the route
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => LogIn()),
          GetPage(name: "/home", page: () => Home()),
          GetPage(
              name: "/settings",
              page: () => Settings(),
              transition: Transition.zoom),
        ],
// ---> End of the route
      ), //GetMaterialApp
    );

class LogIn extends StatelessWidget {
  const LogIn({super.key});
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Obx(() => Text("Route: ${c.userName}"))),
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
      body: Center(
        child: Card(
          elevation: 32,
          shadowColor: Theme.of(context).colorScheme.secondary,
          child: Container(
            width: 320,
            height: 320,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.secondary,
              ), // Border.all
              borderRadius: BorderRadius.circular(5),
            ), //BoxDecoration
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Please Log In",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: c.cont,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ), // InputDecoration
                    onSubmitted: c.changeUserName,
                  ), // TextField
                ), // Padding
              ],
            ), // Column
          ), // Container
        ), //Card
      ), // Center
    ); // Scaffold
  }
}
