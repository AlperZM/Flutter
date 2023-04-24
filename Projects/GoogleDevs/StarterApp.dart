import 'package:flutter/material.dart';

void main() => runApp(const StarterApp());

class StarterApp extends StatefulWidget {
  const StarterApp({super.key});
  @override
  State<StarterApp> createState() => _StarterAppState();
}

class _StarterAppState extends State<StarterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: <Widget>[
            Container(
              width: 250,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: const <Widget>[
                  Text("Starter App", style: TextStyle(fontSize: 18)),
                  Text("Subtitle"),
                  Divider(
                    indent: 0,
                    endIndent: 0,
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Product 1"),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Product 2"),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Product 3"),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Product 4"),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Product 5"),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Product 6"),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Product 7"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 100,
                    color: Colors.purple,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                tooltip: "Share",
                                onPressed: () {},
                                icon: const Icon(Icons.share,
                                    color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                tooltip: "Favorite",
                                onPressed: () {},
                                icon: const Icon(Icons.favorite,
                                    color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                tooltip: "Search",
                                onPressed: () {},
                                icon: const Icon(Icons.search,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
