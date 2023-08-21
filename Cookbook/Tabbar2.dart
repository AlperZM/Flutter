import 'package:flutter/material.dart';

void main() => runApp(TabBarApp());

class TabBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Default TabBar"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: "Flights", icon: Icon(Icons.flight)),
              Tab(
                text: "Trips",
                icon: Icon(Icons.luggage),
              ),
              Tab(text: "Explore", icon: Icon(Icons.explore)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Flights(),
            Trips(),
            Explore(),
          ],
        ),
      ),
    );
  }
}

class Flights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Flights:"),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text("Flights"),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Payments:"),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text("Payments"),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ));
  }
}

class Trips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Trips:"),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text("Trips"),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Payments:"),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text("Payments"),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ));
  }
}

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Explore:"),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text("Explore"),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Payments:"),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text("Payments"),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ));
  }
}
