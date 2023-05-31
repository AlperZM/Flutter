import 'package:flutter/material.dart';

void main() => runApp(const CardApp());

class CardApp extends StatelessWidget {
  const CardApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("CardApp"))),
        body: const CardDemos(),
      ),
    );
  }
}

class CardDemos extends StatelessWidget {
  const CardDemos({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 220,
              height: 220,
              margin: const EdgeInsets.all(10),
              child: Card(
                elevation: 8,
                shadowColor: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.shop),
                      title: Text("Card Title"),
                      subtitle: Text("Card Subtitle and some descriptions"),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      color: Colors.amber,
                      child: const Center(child: Text("Product Img")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text("Add To Chart"),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          child: const Text("Details"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 220,
              height: 220,
              margin: const EdgeInsets.all(10),
              child: Card(
                elevation: 8,
                shadowColor: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.restaurant),
                      title: Text("Restaurant"),
                      subtitle: Text("Order meal for dinner "),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      color: Colors.teal,
                      child: const Center(child: Text("Product Img")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Badge.count(
                          count: 15,
                          child: const Icon(Icons.favorite,
                              size: 32, color: Colors.red),
                        ),
                        TextButton(
                          child: const Text("Details"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
