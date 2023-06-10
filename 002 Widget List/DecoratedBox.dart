import 'package:flutter/material.dart';

void main() => runApp(const DecoratedBoxApp());

class DecoratedBoxApp extends StatelessWidget {
  const DecoratedBoxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("DecoratedBoxApp"))),
        body: const Center(
          child: DecoratedBoxDemo(),
        ),
      ),
    );
  }
}

class DecoratedBoxDemo extends StatelessWidget {
  const DecoratedBoxDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.5, -0.4),
          radius: 0.2,
          colors: <Color>[
            Colors.green,
            Colors.blue,
          ],
          stops: <double>[1.0, 1.0],
        ),
      ),
      child: SizedBox(width: 100, height: 100),
    );
  }
}
