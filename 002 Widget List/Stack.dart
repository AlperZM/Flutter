import 'package:flutter/material.dart';

void main() => runApp(const StackApp());

class StackApp extends StatelessWidget {
  const StackApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Stack App")),
        body: Center(
            child: Stack(
          children: <Widget>[
            Container(width: 400, height: 400, color: Colors.red),
            Container(width: 300, height: 300, color: Colors.blue),
            Positioned(
                right: 0,
                top: 100,
                child: Container(width: 200, height: 200, color: Colors.green)),
          ],
        )),
      ),
    );
  }
}
