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
      children: <Widget>[
        Card(
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          const  ListTile(
            title: Text("Card Title"),
            subtitle: Text("Card Subtitle and some descriptions"),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                child: const Text("Cancel"),
                  onPressed: (){},
                ),
                
              ],
            ),
          ],
        ),
        ),
      ],     
    );
  }
}
