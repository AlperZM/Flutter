import 'package:flutter/material.dart';

void main() => runApp(const TabControllerApp());

class TabControllerApp extends StatelessWidget {
  const TabControllerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});
  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("TabBarController Demo")),
        actions: <Widget>[
          TextButton(
              child:
                  const Text("Actions", style: TextStyle(color: Colors.white)),
              onPressed: () {}),
          TextButton(
              child: const Text("Area", style: TextStyle(color: Colors.white)),
              onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.flutter_dash_outlined, size: 24)),
            Tab(child: Text("Text", style: TextStyle(fontSize: 24))),
            Tab(icon: Icon(Icons.brightness_5_sharp, size: 24)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.flutter_dash_outlined, size: 36, color: Colors.red),
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
    );
  }
}
