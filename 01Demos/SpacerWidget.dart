import 'package:flutter/material.dart';

void main() => runApp(const SpacerWidget());

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("SpacerWidget"))),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          GreenBox(),
          const Spacer(flex: 1),
          BlueBox(),
          const Spacer(flex: 2),
          GreenBox(),
        ],
      ),
    );
  }
}

class GreenBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(),
      ),
      child: const Center(
        child: Text("Container"),
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
      child: const Center(
        child: Text("Spacer"),
      ),
    );
  }
}
