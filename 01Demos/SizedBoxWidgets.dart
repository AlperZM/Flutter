import 'package:flutter/material.dart';

void main() => runApp(const SizedBoxWidget());

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("SizedBoxWidget"))),
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
          RedBox(),
          SizedBox(width: 100, child: BlueBox()),
          const SizedBox(width: 75, child: Text("SizedBox")),
          SizedBox(width: 150, child: BlueBox()),
        ],
      ),
    );
  }
}

class RedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.red,
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
        child: Text("SizedBox"),
      ),
    );
  }
}
