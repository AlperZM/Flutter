// for big, complex apps use this
import 'package:flutter/material.dart';

void main() => runApp(Nav());

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomePage(),
        "/secondPage": (context) => SecondPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Home Page"))),
      body: Center(
        child: SizedBox(
          width: 250,
          child: ElevatedButton(
              child: Row(
                children: const <Widget>[
                  Icon(Icons.arrow_right_alt_outlined),
                  Text("Go To Second Page"),
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/secondPage",
                );
              }),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Second Page"))),
      body: Center(
        child: SizedBox(
          width: 250,
          child: ElevatedButton(
              child: Row(
                children: const <Widget>[
                  Icon(Icons.arrow_left_outlined),
                  Text("Go To Home Page"),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}

