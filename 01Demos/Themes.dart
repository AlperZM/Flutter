import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const appName = "Custom App Themes";
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: "Georgia",
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: "Hind"),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Themes"))),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Text with a background Color",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
