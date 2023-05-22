import 'package:flutter/material.dart';

void main() => runApp(const AlertDialogApp());

class AlertDialogApp extends StatelessWidget {
  const AlertDialogApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("AlertDialogApp"))),
        body: const Center(
          child: AlertDialogDemo(),
        ),
      ),
    );
  }
}

class AlertDialogDemo extends StatelessWidget {
  const AlertDialogDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text("Simple Alert Dialog"),
          onPressed: () {
            showDialog<String>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) => AlertDialog(
                title: const Text("Simple Alert Dialog Title"),
                content: const Text("Alert Dialog Description"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text("OK"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
