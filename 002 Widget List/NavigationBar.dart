import 'package:flutter/material.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});
  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBarDemo(),
    );
  }
}

class NavigationBarDemo extends StatefulWidget {
  const NavigationBarDemo({super.key});

  @override
  State<NavigationBarDemo> createState() => _NavigationBarDemoState();
}

class _NavigationBarDemoState extends State<NavigationBarDemo> {
  int currentPageIndex = 0;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("NavigationBarApp"))),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 32,
        shadowColor: Colors.amber,
        indicatorColor: Colors.teal[200],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.travel_explore_outlined,
            ),
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.directions_railway_outlined,
            ),
            icon: Icon(Icons.commute),
            label: "Commute",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: "Saved",
          ),
        ],
      ),
    );
  }
}
