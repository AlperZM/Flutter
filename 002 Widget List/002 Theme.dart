import 'package:flutter/material.dart';

void main() => runApp(const ThemeApp());

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Theme App"))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("This is a text"),
              Container(
                margin: const EdgeInsets.all(15),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(width: 1),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.favorite),
          onPressed: () {},
        ),
      ),
    );
  }
}
