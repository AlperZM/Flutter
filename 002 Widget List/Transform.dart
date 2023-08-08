import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Transform"))),
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3)..rotateZ(3.14 / 12),
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.orange,
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Horizontal Flip'),
            const SizedBox(width: 2),
            // mirror effeckt
            Transform.flip(
              flipX: true,
              child: const Text('Horizontal Flip'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Transform.rotate(
          angle: 3.14 / 24,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.green,
            child: const Text('Apartment for rent!'),
          ),
        ),
        const SizedBox(height: 20),
        Transform.scale(
          scale: 0.5,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('Bad Idea Bears'),
          ),
        ),
        const SizedBox(height: 20),
        Transform.translate(
          offset: const Offset(0.0, 15.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFF7F7F7F),
            child: const Text('Quarter'),
          ),
        )
      ],
    );
  }
}
