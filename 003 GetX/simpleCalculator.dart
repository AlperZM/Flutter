import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
    GetMaterialApp(debugShowCheckedModeBanner: false, home: const Home()));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
  decrement() => count--;
}

class Home extends StatelessWidget {
  const Home({super.key});
  Widget build(Context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Obx(() => Text("Clicks: ${c.count}")),
      )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: c.increment,
              ),
              const SizedBox(width: 30),
              Obx(() => Text("Home Page Counts: ${c.count}")),
              const SizedBox(width: 30),
              ElevatedButton(
                child: const Icon(Icons.remove),
                onPressed: c.decrement,
              ),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation),
        onPressed: () => Get.to(Other()),
      ),
    );
  }
}

class Other extends StatelessWidget {
  final Controller c = Get.find();
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Obx(() => Text("Second: ${c.count}")),
      )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("Add"),
                onPressed: c.increment,
              ),
              const SizedBox(width: 30),
              Obx(() => Text("Other Page Counts: ${c.count}")),
              const SizedBox(width: 30),
              ElevatedButton(
                child: const Text("Remove"),
                onPressed: c.decrement,
              ),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () => Get.to(Home()),
      ),
    );
  }
}
