import 'package:flutter/material.dart';

void main() => runApp(const BottomNavBarApp());

class BottomNavBarApp extends StatefulWidget {
  const BottomNavBarApp({super.key});
  @override
  State<BottomNavBarApp> createState() => _BottomNavBarAppState();
}

class _BottomNavBarAppState extends State<BottomNavBarApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
    Text(
      "Index 3: Settings",
      style: optionStyle,
    ),
    Text(
      "Index 4: Social",
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
            const Text("""BottomNavigationBarType.shifting
            between 4 - 5 nav items...
            """, style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Business",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "School",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.social_distance),
              label: "Social",
              backgroundColor: Colors.pink,
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
