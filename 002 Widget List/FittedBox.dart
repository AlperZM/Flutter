import 'package:flutter/material.dart';

void main() => runApp(const FittedBoxApp());

class FittedBoxApp extends StatelessWidget {
  const FittedBoxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text(" FittedBoxApp"))),
        body: const Center(child: FittedBoxDemo()),
      ),
    );
  }
}

class FittedBoxDemo extends StatelessWidget {
  const FittedBoxDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 200,
          height: 100,
          color: Colors.amber,
          child: const FittedBox(
            fit: BoxFit.fill,
            child: Icon(Icons.flutter_dash),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 100,
          height: 100,
          color: Colors.teal,
          child: const FittedBox(
            fit: BoxFit.fill,
            child: Icon(Icons.flutter_dash),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 200,
          height: 200,
          color: Colors.orange,
          child: const FittedBox(
            fit: BoxFit.cover,
            child: Icon(Icons.flutter_dash),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 300,
          height: 50,
          alignment: Alignment.centerLeft,
          color: Colors.red,
          child: const FittedBox(
            fit: BoxFit.fitHeight,
            child: Icon(Icons.flutter_dash),
          ),
        ),
      ],
    );
  }
}
