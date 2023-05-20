// define appbar once and use everywhere
import 'package:flutter/material.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: DemoAppBar(),
      ),
    );
  }
}

//define this class and use any page
class DemoAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60); //define appbars height
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text("DemoApp")),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.dark_mode),
          tooltip: "Dark Mode",
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.calendar_today),
          tooltip: "Calendar",
          onPressed: () {},
        ),
      ],
    );
  }
}
