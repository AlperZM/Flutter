import 'package:flutter/material.dart';

void main() => runApp(const ButtonsApp());

class ButtonsApp extends StatelessWidget {
  const ButtonsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.cyan,
          secondary: Colors.cyanAccent,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.orangeAccent, fontSize: 22),
        ),
        iconTheme: const IconThemeData(color: Colors.tealAccent, size: 30),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Buttons App"))),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text("Elevated"),
                    onPressed: () {
                      print("ElevatedButton");
                    },
                    onLongPress: () {
                      print("LongPressed");
                    },
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    child: const Text("Filled"),
                    onPressed: () {
                      print("Filled Button");
                    },
                  ),
                  const SizedBox(height: 20),
                  FilledButton.tonal(
                    child: const Text("Filled Tonal"),
                    onPressed: () {
                      print("Filled Button");
                    },
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      print("Outlined");
                    },
                    child: const Text("Outlined"),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    child: Text(
                      "Text",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onPressed: () {
                      print("Text");
                    },
                  ),
                  const SizedBox(height: 20),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      print("Icon");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
