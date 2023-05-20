import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // initials the default tab index
      length: 3, // how many tabs do you use?
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TabBar Demo"),
          actions: <Widget>[
            IconButton(
              tooltip: "IconButton > Prints",
              icon: const Icon(Icons.chat),
              onPressed: () {
                print("Actions");
              },
            ),
            TextButton(
                child: const Text("SnackBar",
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Actions in Snackbar"),
                    ),
                  );
                }),
          ],

// TabBar starts from here
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.flutter_dash)),
              Tab(text: "Text"),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),

// Body for tabs
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.flutter_dash_outlined,
                      size: 36, color: Colors.red),
                  SizedBox(height: 20),
                  Text("For the First Tab",
                      style: TextStyle(fontSize: 18, color: Colors.red)),
                  SizedBox(height: 20),
                  Text("This is the first tabs view page"),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.text_fields, size: 36, color: Colors.blue),
                  SizedBox(height: 20),
                  Text("For the Second Tab",
                      style: TextStyle(fontSize: 18, color: Colors.blue)),
                  SizedBox(height: 20),
                  Text("This is the second tabs view page"),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.brightness_5_outlined,
                      size: 36, color: Colors.green),
                  SizedBox(height: 20),
                  Text("For the Third Tab",
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  SizedBox(height: 20),
                  Text("This is the third tabs view page"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
