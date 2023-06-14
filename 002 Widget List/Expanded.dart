import 'package:flutter/material.dart';

void main() => runApp(const ExpandedApp());

class ExpandedApp extends StatelessWidget {
  const ExpandedApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("ExpandedApp"))),
        body: const Center(child: ExpandedDemo()),
      ),
    );
  }
}

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Simple Expanded"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 50, height: 50, color: Colors.blue),
            Expanded(
                child: Container(
                    height: 50,
                    color: Colors.red,
                    child: const Text("Expanded",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center))),
            Container(width: 50, height: 50, color: Colors.blue),
          ],
        ),
        const SizedBox(height: 20),
        const Text("Expanded with flex factor"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 50, height: 50, color: Colors.blue),
            Expanded(
              flex: 3,
              child: Container(
                  height: 50,
                  color: Colors.green,
                  child: const Text("Expanded flex3",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center)),
            ),
            Container(width: 50, height: 50, color: Colors.blue),
            Expanded(
              flex: 2,
              child: Container(
                  height: 50,
                  color: Colors.green,
                  child: const Text("Expanded with flex2",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center)),
            ),
            Container(width: 50, height: 50, color: Colors.blue),
          ],
        ),
      ],
    );
  }
}
