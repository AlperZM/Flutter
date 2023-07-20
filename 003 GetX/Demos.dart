//Dependency Management
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//run app with GetMaterialApp => use all features of Getx
void main() => runApp(
      GetMaterialApp(
          debugShowCheckedModeBanner: false, home: Home()), //GetMaterialApp
    );

// ---------->>Controller class
// logic section of app
class Controller extends GetxController {
  var res = "default".obs;
  var count = 0.obs;
  increment() => count++;
  decrement() => count--;
  reset() => count * 0;
}

// ----------->> Home class
class Home extends StatelessWidget {
  @override
  Widget build(context) {
// ------>> // Rather Controller controller = Controller();
// adds Dependency, can use any variable...
    Controller controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("GetX Demos")),
        actions: [
          IconButton(
            tooltip: "Theme",
            onPressed: () {
// ----------->>  change Theme
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            icon: const Icon(
              Icons.model_training_outlined,
            ), //Icon
          ), //IconButton
          const SizedBox(width: 20),
        ],
      ), //AppBar
      body: Center(child: AppBody()),
    ); //Scaffold
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: TextField(
            onChanged: (String value) {
              controller.res.value = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Obx(() => Text(controller.res.value))
      ],
    );
  }
}
