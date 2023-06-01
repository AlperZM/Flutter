import 'package:flutter/material.dart';

void main() => runApp(const ChipApp());

class ChipApp extends StatefulWidget {
  const ChipApp({super.key});
  @override
  State<ChipApp> createState() => _ChipAppState();
}

class _ChipAppState extends State<ChipApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("ChipApp"))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Simple Chips", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Chip(
                    elevation: 16,
                    shadowColor: Colors.amberAccent,
                    backgroundColor: Colors.amberAccent,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.teal[100],
                      child: const Text("ID"),
                    ),
                    label: const Text("Ivan Doe"),
                  ),
                  const SizedBox(width: 10),
                  const Chip(
                    backgroundColor: Colors.tealAccent,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      child: Icon(Icons.abc, size: 26),
                    ),
                    label: Text("Simple Chip"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("InputChip Sample", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InputChip(
                      backgroundColor: Colors.amberAccent,
                      avatar: const CircleAvatar(
                        backgroundColor: Colors.tealAccent,
                        child: Icon(Icons.person),
                      ),
                      label: const Text("Input 1"),
                      selected: false,
                      onSelected: (bool selected) {
                        setState(() {
                          selected ? false : true;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
