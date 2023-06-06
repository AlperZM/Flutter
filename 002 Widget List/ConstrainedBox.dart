import 'package:flutter/material.dart';

void main() => runApp(const ConstrainedBoxApp());

class ConstrainedBoxApp extends StatelessWidget {
  const ConstrainedBoxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.cyanAccent,
          secondary: Colors.brown,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.orangeAccent, fontSize: 22),
        ),
        iconTheme: const IconThemeData(color: Colors.tealAccent, size: 30),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("ConstrainedBoxApp"))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 50,
                maxWidth: 200,
                minHeight: 50,
                maxHeight: 200,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: const Text("Constraints", textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
