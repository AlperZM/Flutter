import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My App"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.telegram),
              tooltip: "Telegram",
              onPressed: () {},
            ),
          ],
        ),
        body: AppBody(),
        floatingActionButton: const AppFAB(),
        bottomNavigationBar: const AppBNB(),
        drawer: const AppDrawer(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 2, color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.greenAccent,
              offset: Offset(5, 5),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ]),
      child: RichText(
        text: const TextSpan(
          text: "Hello ",
          style: TextStyle(fontSize: 18, color: Colors.red),
          children: <TextSpan>[
            TextSpan(
                text: "World!\n", style: TextStyle(color: Colors.redAccent)),
            TextSpan(
              text: "This is RichText Widget",
            ),
          ],
        ),
      ),
    );
  }
}

class AppFAB extends StatelessWidget {
  const AppFAB({super.key});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.navigation),
      label: const Text("Run"),
    );
  }
}

class AppBNB extends StatelessWidget {
  const AppBNB({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.holiday_village),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: "Work",
        ),
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.cyan[200],
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text("Drawer Header",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
