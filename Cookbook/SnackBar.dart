import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("SnackBar"))),
        body: Center(
          child: AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ElevatedButton(
            child: const Text("Simple SnackBar"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(defaultSnackBar);
            },
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ElevatedButton(
            child: const Text("Custom SnackBar"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(customSnackBar);
            },
          ),
        )
      ],
    );
  }
}

const defaultSnackBar = SnackBar(
  content: Center(child: Text("Default SnackBar")),
);
var customSnackBar = SnackBar(
  content: const Center(child: Text("Custom SnackBar")),
  backgroundColor: Colors.amber,
  action: SnackBarAction(label: "Action", onPressed: () {}),
  behavior: SnackBarBehavior.floating,
  showCloseIcon: true,
  closeIconColor: Colors.black,
  dismissDirection: DismissDirection.startToEnd,
  duration: const Duration(seconds: 3),
  elevation: 16,
);
