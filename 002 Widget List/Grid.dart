import 'package:flutter/material.dart';

void main() => runApp(const GridApp());

class GridApp extends StatelessWidget {
  const GridApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("GridApp"))),
        body: const Center(child: GridDemo()),
      ),
    );
  }
}

class GridDemo extends StatelessWidget {
  const GridDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: GridView.count(
                padding: const EdgeInsets.all(5),
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                crossAxisCount: 4,
                children: <Widget>[
                  Container(
                    color: Colors.teal[100],
                    child: const Text("Default"),
                  ),
                  Container(
                    color: Colors.teal[200],
                    child: const Text("Grid"),
                  ),
                  Container(
                    color: Colors.teal[300],
                    child: const Text("View"),
                  ),
                  Container(
                    color: Colors.teal[400],
                  ),
                  Container(
                    color: Colors.amber[400],
                  ),
                  Container(
                    color: Colors.amber[300],
                  ),
                  Container(
                    color: Colors.amber[200],
                  ),
                  Container(
                    color: Colors.amber[100],
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.purple,
                  ),
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.cyan,
                  ),
                  Container(
                    color: Colors.brown,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.purple,
                  ),
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.cyan,
                  ),
                  Container(
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              margin: const EdgeInsets.all(10),
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: GridView.builder(
                  padding: const EdgeInsets.all(5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 3,
                  ),
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        color: Colors.orange,
                        child: Center(child: Text("$index")));
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
