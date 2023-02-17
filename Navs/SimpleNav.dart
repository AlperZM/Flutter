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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: AppBody(),
        floatingActionButton: const AppFAB(),
        bottomNavigationBar: AppBNB(),
        drawer: const AppDrawer(),
      ),
    );
  }
}

// body - home page
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RichText(
            text: const TextSpan(
              text: "Hello ",
              style: TextStyle(fontSize: 18, color: Colors.red),
              children: <TextSpan>[
                TextSpan(
                    text: "World!\n",
                    style: TextStyle(color: Colors.redAccent)),
                TextSpan(
                  text: "This is First page",
                ),
              ],
            ),
          ),
          ElevatedButton(
            child: const Text("Work Page"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SecondPage();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

// floatingAction button
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

// Bottom Navigation Bar
class AppBNB extends StatefulWidget {
  @override
  State<AppBNB> createState() => _AppBNBState();
}

class _AppBNBState extends State<AppBNB> {
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

// drawer
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

//SecondPage
class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Second Page"),
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
      body: Container(
        width: 300,
        height: 300,
        margin: const EdgeInsets.all(40),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(width: 2, color: Colors.indigo),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  border: Border.all(width: 3, color: Colors.white)),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('first Page',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const AppFAB(),
      bottomNavigationBar: AppBNB(),
      drawer: const AppDrawer(),
    );
  }
}
