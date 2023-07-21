import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
    GetMaterialApp(debugShowCheckedModeBanner: false, home: const Home()));

class Controller extends GetxController {
  int counter = 0;

//----->> Set to acces controller (optional)
  static Controller get to => Get.find();
  void increment() {
    counter++;
    update();
  }

  void decrement() {
    counter--;
    update();
  }

  void reset() {
    counter = 0;
    update();
  }

  TextStyle styleNormal = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  TextStyle styleLow = TextStyle(
    fontSize: 22,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );
  TextStyle styleHight = TextStyle(
    fontSize: 22,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  );
}

class Home extends StatelessWidget {
  const Home({super.key});
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("GetBuilder")),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
// ------>> Use one of the way to access the Controller
                  Get.find<Controller>().increment();
                },
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                child: const Icon(Icons.remove),
                onPressed: () {
// ----->> use other way to acces the Controller
                  Controller.to.decrement();
                },
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                child: const Text("Reset"),
                onPressed: () {
                  Controller.to.reset();
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          GetBuilder<Controller>(
            init: Controller(),
            builder: (_) => Text(
              "Text1 : ${_.counter}",
              style: _.counter < 5
                  ? Controller.to.styleNormal
                  : Controller.to.styleHight,
            ),
          ),
          const SizedBox(height: 20),
          GetBuilder<Controller>(
            init: Controller(),
            builder: (_) => Text(
              "Text2 : ${_.counter}",
              style: _.counter > -5
                  ? Controller.to.styleNormal
                  : Controller.to.styleLow,
            ),
          ),
          const SizedBox(height: 20),
          GetBuilder<Controller>(
            init: Controller(),
            builder: (_) => Text("Text3 : ${_.counter}"),
          ),
        ],
      ),
    );
  }
}
