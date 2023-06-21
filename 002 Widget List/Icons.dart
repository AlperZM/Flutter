import 'package:flutter/material.dart';

void main() => runApp(const IconsApp());

class IconsApp extends StatelessWidget {
  const IconsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("IconsApp"))),
        body: const Center(child: IconDemos()),
      ),
    );
  }
}

class IconDemos extends StatelessWidget {
  const IconDemos({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal[100],
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(child: Icon(Icons.add)),
            ),
          ],
        ),
      ],
    );
  }
}
