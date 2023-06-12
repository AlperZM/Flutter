import 'package:flutter/material.dart';

void main() => runApp(const DividerApp());

class DividerApp extends StatelessWidget {
  const DividerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerTheme: const DividerThemeData(
          space: 20,
          thickness: 5,
          color: Colors.purple,
          indent: 20,
          endIndent: 20,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("DividerApp"))),
        body: const Center(child: DividerDemo()),
      ),
    );
  }
}

class DividerDemo extends StatelessWidget {
  const DividerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Horizontal Divider"),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            children: <Widget>[
              Container(width: 200, height: 60, color: Colors.blue),
              const Divider(),
              Container(width: 200, height: 60, color: Colors.green),
              const Divider(),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text("Vertical Divider"),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Row(
            children: <Widget>[
              Container(width: 60, height: 200, color: Colors.blue),
              const VerticalDivider(),
              Container(width: 60, height: 200, color: Colors.green),
              const VerticalDivider(),
            ],
          ),
        ),
      ],
    );
  }
}
