import 'package:flutter/material.dart';

void main() => runApp(const Flutter001());

class Flutter001 extends StatelessWidget {
  const Flutter001({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Flutter001"))),
        body: Center(
            child: Container(
                color: Colors.greenAccent,
                child: const Center(
                    child: Text("Wellcome to Flutter",
                        style: TextStyle(fontSize: 30, color: Colors.blue))))),
      ),
    );
  }
}
