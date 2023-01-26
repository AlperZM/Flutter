import 'package:flutter/material.dart';

void main() => runApp(AlertApp());

class AlertApp extends StatefulWidget {
  @override
  State<AlertApp> createState() => _AlertAppState();
}

class _AlertAppState extends State<AlertApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Alert Dialog")),
        ),
        body: Alert(),
      ),
    );
  }
}

class Alert extends StatefulWidget {
  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("AlertDialog Title"),
            content: const Text("AlertDialog Description"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, "Cancel"),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, "Ok"),
                child: const Text("Ok"),
              ),
            ],
          ),
        ),
        child: const Text("Alert Button"),
      ),
    );
  }
}
