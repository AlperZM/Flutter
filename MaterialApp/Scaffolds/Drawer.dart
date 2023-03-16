import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Drawer App",
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Drawer App"))),
        body: const AppBody(),
        drawer: const AppDrawer(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Drawer App"));
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber,
                  ),
                  child: const Center(
                    child: Text("J", style: TextStyle(fontSize: 30)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: const Center(
                    child: Text("exp@exp.com", style: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: const Center(
                    child: Text("John Doe", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_circle_right),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Persons"),
            trailing: const Icon(Icons.arrow_circle_right),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
