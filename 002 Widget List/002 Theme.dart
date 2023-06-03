import 'package:flutter/material.dart';

void main() => runApp(const ThemeApp());

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.amber,
          secondary: Colors.teal,
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.red, fontSize: 22)),
        iconTheme: const IconThemeData(
          size: 40,
          color: Colors.red,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Theme")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text("buton"),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 20),
                  Icon(Icons.abc),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                color: ColorScheme.fromSwatch().copyWith().secondary,
              ),
              const SizedBox(height: 20),
              const Text("demo theme"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, IconThemeData),
          onPressed: () {},
        ),
      ),
    );
  }
}
