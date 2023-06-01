import 'package:flutter/material.dart';

void main() => runApp(const ChipApp());

class ChipApp extends StatefulWidget {
  const ChipApp({super.key});
  @override
  State<ChipApp> createState() => _ChipAppState();
}

class _ChipAppState extends State<ChipApp> {
  int inputs = 3;
  int? selectedIndex;

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
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: List<Widget>.generate(
                      inputs,
                      (int index) {
                        return InputChip(
                          backgroundColor: Colors.blueAccent[100],
                          checkmarkColor: Colors.green,
                          deleteButtonTooltipMessage: "Remove",
                          deleteIcon: const Icon(Icons.delete),
                          deleteIconColor: Colors.red,
                          selectedColor: Colors.lime,
                          avatar: CircleAvatar(
                            backgroundColor: Colors.limeAccent,
                            child: Text("$index"),
                          ),
                          label: Text("Input $index"),
                          selected: selectedIndex == index,
                          onSelected: (bool selected) {
                            setState(() {
                              if (selectedIndex == index) {
                                selectedIndex = null;
                              } else {
                                selectedIndex = index;
                              }
                            });
                          },
                          onDeleted: () {
                            setState(() {
                              inputs = inputs - 1;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    child: const Text("Reset"),
                    onPressed: () {
                      setState(() {
                        inputs = 3;
                      });
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
