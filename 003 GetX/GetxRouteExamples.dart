import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatelessWidget{
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Getx Home")),
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
      body: Container(
        width: 320, height: 320,
        color: Colors.amber,
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Home Page"),
          onTap:(){Get.to(Home());}
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings Page"),
          onTap:(){Get.to(Settings());}
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text("Chart Page"),
          onTap:(){Get.to(Chart());}
        ),
],
        ),
      ),
    );
  }
}
class Settings extends StatelessWidget{
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Getx Settings")),
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
      body: Container(
        width: 320, height: 320,
        color: Colors.teal,
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Home Page"),
          onTap:(){Get.to(Home());}
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings Page"),
          onTap:(){Get.to(Settings());}
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text("Chart Page"),
          onTap:(){Get.to(Chart());}
        ),
],
        ),
      ),
    );
  }
}
class Chart extends StatelessWidget{
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Getx Chart")),
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
       body: Container(
        width: 320, height: 320,
        color: Colors.cyan,
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Home Page"),
          onTap:(){Get.to(Home());}
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings Page"),
          onTap:(){Get.to(Settings());}
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text("Chart Page"),
          onTap:(){Get.to(Chart());}
        ),
],
        ),
      ),
    );
  }
}
