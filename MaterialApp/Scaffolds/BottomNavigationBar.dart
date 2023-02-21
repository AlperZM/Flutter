import 'package:flutter/material.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DemoApp 1 includes Bottom Nav bar",
      routes: {
        "/": (context) => HomePage(),
        "/Discover": (context) => SearchPage(),
        "/Shopping": (context) => ShoppingPage(),
        "/Payments": (context) => PaymentsPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("This is the Home Page", style: TextStyle(fontSize: 20)),
            Container(
              margin: const EdgeInsets.all(15),
              width: 200,
              height: 200,
              color: Colors.teal,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BNB(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("This is the Search Page",
                style: TextStyle(fontSize: 20)),
            Container(
              margin: const EdgeInsets.all(15),
              width: 200,
              height: 200,
              color: Colors.purple,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BNB(),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("This is the Shopping Page",
                style: TextStyle(fontSize: 20)),
            Container(
              margin: const EdgeInsets.all(15),
              width: 200,
              height: 200,
              color: Colors.green,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BNB(),
    );
  }
}

class DemoAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  State<DemoAppBar> createState() => _DemoAppBarState();
}

class _DemoAppBarState extends State<DemoAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Demo App With BottomnavBar"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.dark_mode, size: 20),
          tooltip: "Dark Mode",
          onPressed: () {},
        ),
      ],
    );
  }
}

class PaymentsPage extends StatefulWidget {
  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("This is the Payments Page",
                style: TextStyle(fontSize: 20)),
            Container(
              margin: const EdgeInsets.all(15),
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BNB(),
    );
  }
}

class BNB extends StatefulWidget {
  @override
  State<BNB> createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ShoppingPage(),
    PaymentsPage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Home Page",
          backgroundColor: Colors.teal,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Discover",
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: "Shopping",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment_outlined),
          label: "Payments",
          backgroundColor: Colors.blue,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black26,
      onTap: _onTapped,
    );
  }
}
