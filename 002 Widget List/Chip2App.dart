import 'package:flutter/material.dart';

void main() => runApp(const Chip2App());

class Chip2App extends StatefulWidget {
  const Chip2App({super.key});
  @override
  State<Chip2App> createState() => _Chip2AppState();
}

class _Chip2AppState extends State<Chip2App> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("ChipApp2"))),
        body: Center(
          child: ActionChip(
            backgroundColor: Colors.amber[100],
            avatar: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            label: const Text("Like", style: TextStyle(color: Colors.red)),
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
          ),
        ),
      ),
    );
  }
}
