
import 'package:flutter/material.dart';

void main() => runApp(const BadgeApp());

class BadgeApp extends StatelessWidget {
  const BadgeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("BadgeApp"))),
        body: const Center(child: BadgeDemo()),
      ),
    );
  }
}

class BadgeDemo extends StatelessWidget {
  const BadgeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Badge.count(
          // set the text style
          textStyle: const TextStyle(
            fontSize: 22,
          ),
          // set the Badge style
          largeSize: 32,
          alignment: const FractionalOffset(2, 0.5),
          count: 5,
          child: const Icon(Icons.favorite_border, size: 50, color: Colors.red),
        ),
        const SizedBox(width: 20),
        Badge.count(
          // set the text style
          textStyle: const TextStyle(
            fontSize: 22,
          ),
          // set the Badge style
          largeSize: 32,
          alignment: const FractionalOffset(2, 0.5),
          count: 5,
          child: const Icon(Icons.warning, size: 50, color: Colors.red),
        ),
        const SizedBox(width: 20),
        Badge.count(
          // set the text style
          textStyle: const TextStyle(
            fontSize: 22,
          ),
          backgroundColor: Colors.green,
          textColor: Colors.black,
          // set the Badge style
          largeSize: 32,
          alignment: const FractionalOffset(1.5, 0.5),
          count: 5,
          child: TextButton(
            child: const Text("TextButton"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
