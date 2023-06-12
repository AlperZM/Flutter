import 'package:flutter/material.dart';

void main() => runApp(const DrawerApp());

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Drawer"))),
        body: const Center(child: Text("Drawer App")),
        drawer: const DrawerWidget(),
        endDrawer: const EndDrawerWidget(),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text("Draver header",
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text("Message"),
            subtitle: const Text("List tile for message"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Message"),
            subtitle: const Text("List Tile for left Drawer"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Message"),
            subtitle: const Text("subtitle for list tile"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text("Draver header",
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text("Message"),
            subtitle: const Text("List tile for message"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Message"),
            subtitle: const Text("List Tile for RIGHT Drawer"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Message"),
            subtitle: const Text("subtitle for list tile"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
