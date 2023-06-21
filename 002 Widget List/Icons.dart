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
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                  child: Icon(Icons.add, color: Colors.blue, size: 30)),
            ),
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                  child: Icon(
                Icons.add,
              )),
            ),
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                  child: Icon(Icons.favorite,
                      semanticLabel: "Favorite", color: Colors.pink)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.all(10),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.android,
                          color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                  )),
            ),
            Center(
              child: Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: IconButton.outlined(
                      icon: const Icon(Icons.android,
                          color: Colors.blue, size: 30),
                      onPressed: () {},
                    ),
                  )),
            ),
            Center(
              child: Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.all(10),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton.filled(
                      icon:
                          const Icon(Icons.mic, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
