import 'package:flutter/material.dart';

void main() => runApp(const DissmisibleApp());

class DissmisibleApp extends StatelessWidget {
  const DissmisibleApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("DissmisibleApp"))),
        body: const Center(child: DissmisibleDemo()),
      ),
    );
  }
}

class DissmisibleDemo extends StatefulWidget {
  const DissmisibleDemo({super.key});
  @override
  State<DissmisibleDemo> createState() => _DissmisibleDemoState();
}

class _DissmisibleDemoState extends State<DissmisibleDemo> {
  List<int> items = List<int>.generate(10, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Default Dissmisble",
            style: TextStyle(color: Colors.red, fontSize: 20)),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 200,
          height: 200,
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  background: Container(color: Colors.red),
                  key: ValueKey<int>(items[index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text("Item: ${items[index]}"),
                    subtitle: Text("index no: ${items[index]}"),
                  ),
                );
              }),
        ),
        const SizedBox(height: 20),
        const Text("Custom Dismissible",
            style: TextStyle(color: Colors.red, fontSize: 20)),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 200,
          height: 200,
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.vertical,
                  background: Container(
                    color: Colors.green,
                    child: const Icon(Icons.check),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: const Icon(Icons.cancel),
                  ),
                  key: ValueKey<int>(items[index]),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text("Item: ${items[index]}"),
                    subtitle: Text("index no: ${items[index]}"),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
