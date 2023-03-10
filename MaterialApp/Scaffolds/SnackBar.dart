//snackbar act like bottom alert section
import 'package:flutter/material.dart';
void main() => runApp(const SnackBarApp());
class SnackBarApp extends StatelessWidget {
  const SnackBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("SnackBar"))),
        body: Center(child: DemoSnackBar()),
      ),
    );
  }
}
class DemoSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("This is a SnackBar"),
              action: SnackBarAction(
                label: "Understand",
                onPressed: () {},
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Icon(Icons.donut_large, size: 20),
            Text("Show SnackBar"),
          ],
        ),
      ),
    );
  }
}

//costomized Snack bar
import 'package:flutter/material.dart';

void main() => runApp(const SnackBarApp());

class SnackBarApp extends StatelessWidget {
  const SnackBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("SnackBar"))),
        body: Center(child: DemoSnackBar()),
      ),
    );
  }
}

class DemoSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("This is a SnackBar"),
              action: SnackBarAction(
                label: "Understand",
                onPressed: () {},
              ),
              duration: const Duration(milliseconds: 2000), // sets duration of snackbar
              width: 300.0, // snackBar width
              padding: const EdgeInsets.symmetric( // inner items padding in snackbar
                horizontal: 8.0,
              ),
              behavior: SnackBarBehavior.floating, // gives space from bottom and Snackbar
              shape: RoundedRectangleBorder( // gives shape for SnackBar
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Icon(Icons.donut_large, size: 20),
            Text("Show SnackBar"),
          ],
        ),
      ),
    );
  }
}
