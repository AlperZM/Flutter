import 'package:flutter/material.dart';

void main() => runApp(const TooltipApp());

class TooltipApp extends StatelessWidget {
  const TooltipApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Tooltip"))),
        body: const Center(child: TooltipDemo()),
      ),
    );
  }
}

class TooltipDemo extends StatelessWidget {
  const TooltipDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Tooltip(
          message: "Default Tooltip",
          child: Icon(Icons.text_fields, size: 32),
        ),
        SizedBox(height: 20),
        Tooltip(
          message: "Customized Tooltip",
          height: 30,
          decoration: BoxDecoration(
            color: Colors.cyan,
          ),
          showDuration: Duration(seconds: 3),
          waitDuration: Duration(seconds: 1),
          child: Icon(Icons.text_fields_outlined, size: 32),
        ),
      ],
    );
  }
}
