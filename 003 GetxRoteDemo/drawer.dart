import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controls.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal[400],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber[400],
                  ),
                  child: Center(
                      child: Text("${c.userAvatarText}",
                          style: TextStyle(fontSize: 30))),
                ),
                Container(
                    margin: const EdgeInsets.all(5),
                    child: Center(child: Text("${c.userName}"))),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Center(child: Text("${c.userEmail}")),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Get.back();
              Get.toNamed("/settings");
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble),
            title: const Text("Alert Dialog"),
            onTap: () {
              Get.defaultDialog(
                  onConfirm: () => print("Ok"),
                  middleText: "Dialog made in 3 lines of code");
            },
          ),
          ListTile(
              leading: const Icon(Icons.post_add),
              title: const Text("Bottom Sheet"),
              onTap: () {
                Get.bottomSheet(Container(
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                          leading: Icon(Icons.music_note),
                          title: Text('Music'),
                          onTap: () {}),
                    ],
                  ),
                ));
              }),
          ListTile(
              leading: const Icon(Icons.space_bar),
              title: const Text("SnackBar"),
              onTap: () {
                Get.snackbar('Hi', 'i am a modern snackbar');
              }),
        ],
      ),
    );
  }
}
