import 'package:flutter/material.dart';

void main() => runApp(const BottomNavBarApp());

class BottomNavBarApp extends StatefulWidget {
  const BottomNavBarApp({super.key});
  @override
  State<BottomNavBarApp> createState() => _BottomNavBarAppState();
}

class _BottomNavBarAppState extends State<BottomNavBarApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      "Index 0: Home",
      style: optionStyle,
    ),
    Text(
      "Index 1: Business",
      style: optionStyle,
    ),
    Text(
      "Index 2: School",
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("BottomNavBarApp"))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("BottomNavigationBarType.fixed"),
              const SizedBox(height: 10),
              const Text("Less than 4 items in bottom nav"),
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal,
          elevation: 16,
          iconSize: 32,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Business",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "School",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
