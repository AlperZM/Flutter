import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // ---->> Login Page Controllers
  var userName = "User".obs;
  TextEditingController cont = TextEditingController();
  changeUserName(String val) {
    userName.value = val;
    val = "";
    cont.clear();
    Get.back();
  }
  // ----> end of the login page controllers
}

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ), //GetMaterialApp
    );

class Home extends StatelessWidget {
  const Home({super.key});
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text("Get.dialog"),
                onPressed: () {
                  Get.dialog(const UserAuth());
                }),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("SnackBar"),
              onPressed: () {
                Get.snackbar(
                  "Hey i'm a Get SnackBar!", // title
                  "It's unbelievable! I'm using SnackBar without context, without boilerplate, without Scaffold, it is something truly amazing!", // message
                  icon: Icon(Icons.alarm),
                  shouldIconPulse: true,
                  barBlur: 20,
                  isDismissible: true,
                  duration: Duration(seconds: 5),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                child: const Text("BottomSheet"),
                onPressed: () {
                  Get.bottomSheet(Container(
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.music_note),
                            title: Text('Music'),
                            onTap: () {}),
                        ListTile(
                          leading: Icon(Icons.videocam),
                          title: Text('Video'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ));
                }),
          ],
        ),
      ), // Center
      drawer: Drawer(),
    ); // Scaffold
  }
}

class UserAuth extends StatelessWidget {
  const UserAuth({super.key});
  @override
  Widget build(context) {
    final Controller c = Get.find();
    return Card(
      child: Container(
        width: 320,
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login"),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: c.cont,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Enter Your Name",
                ),
                onSubmitted: c.changeUserName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
