import 'package:flutter/material.dart';

enum SampleItem { red, blue, green }

void main() => runApp(const PopupMenuApp());

class PopupMenuApp extends StatelessWidget {
  const PopupMenuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("PopupMenuApp"))),
        body: const Center(child: PopupMenuDemo()),
      ),
    );
  }
}

class PopupMenuDemo extends StatefulWidget {
  const PopupMenuDemo({super.key});
  @override
  State<PopupMenuDemo> createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {
  SampleItem? selectedMenu;
  Color _color = Colors.cyan;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PopupMenuButton<SampleItem>(
          color: Colors.red[100],
          elevation: 16,
          icon: const Icon(Icons.menu_book),
          iconSize: 40,
          tooltip: "Select a color",
          surfaceTintColor: Colors.purple,
          splashRadius: 50,
          shadowColor: Colors.purple,
          initialValue: selectedMenu,
          onSelected: (SampleItem item) {
            setState(() {
              selectedMenu = item;
              if (item == SampleItem.red) {
                _color = Colors.red;
              } else if (item == SampleItem.green) {
                _color = Colors.blue;
              } else {
                _color = Colors.green;
              }
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.red,
              child: Text("Red"),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.blue,
              child: Text("Blue"),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.green,
              child: Text("Green"),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Container(
          width: 200,
          height: 200,
          color: _color,
        ),
      ],
    );
  }
}
