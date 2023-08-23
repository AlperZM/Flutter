import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(25, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Dismissable")),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("$item dismissed")),
                    );
                  });
                },
                background: Container(color: Colors.red),
                child: ListTile(title: Text(item)),
              );
            }),
      ),
    );
  }
}
