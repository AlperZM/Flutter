import 'package:flutter/material.dart';

void main() => runApp(const ButtonsApp());

const List<String> list = <String>["Select", "Cat", "Dog", "Bird", "Fish"];
const List<String> list2 = <String>["Select Items", "Apple", "Orange"];

class ButtonsApp extends StatelessWidget {
  const ButtonsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Center(child: Text("Dropdown-Elevated Buttons"))),
        body: const Center(child: ButtonsDemo()),
      ),
    );
  }
}

class ButtonsDemo extends StatefulWidget {
  const ButtonsDemo({super.key});
  @override
  State<ButtonsDemo> createState() => _ButtonsDemoState();
}

class _ButtonsDemoState extends State<ButtonsDemo> {
  String dropdownValue = list.first;
  String dropValue = list2.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Dropdown with List"),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward, size: 20, color: Colors.blue),
          elevation: 16,
          style: const TextStyle(color: Colors.redAccent),
          underline: Container(height: 2, color: Colors.red),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        const Text("Dropdown List with manuel"),
        DropdownButton<String>(
          value: dropValue,
          icon: const Icon(Icons.arrow_circle_down_outlined, size: 20),
          elevation: 16,
          hint: const Text("Select Item"),

//-----------> Set Details
          alignment: Alignment.center,
          autofocus: false,
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Colors.amber,
          focusColor: Colors.teal[100],
          menuMaxHeight: 100,

          style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
          underline: Container(height: 2, color: Colors.greenAccent),
          onChanged: (String? value2) {
            setState(() {
              dropValue = value2!;
            });
          },
          items: list2.map<DropdownMenuItem<String>>((String value2) {
            return DropdownMenuItem<String>(
              value: value2,
              child: Text(value2),
            );
          }).toList(),
        ),
      ],
    );
  }
}
