import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LogIn(),
      ),//GetMaterialApp
    );

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
            ),//Icon
          ),// IconButton
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
              ),// Border.all
              borderRadius: BorderRadius.circular(5),
            ),//BoxDecoration
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
                    controller: c._controller,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),// InputDecoration
                    onSubmitted: c.changeUserName,
                  ),// TextField
                ),// Padding
              ],
            ),// Column
          ),// Container
        ),//Card
      ),// Center
    );// Scaffold
  }
}
