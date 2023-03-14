import 'package:flutter/material.dart';

void main() => runApp(const Flexibles());

class Flexibles extends StatelessWidget {
  const Flexibles({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Flexibles"))),
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
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: PurpleBox(),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: PurpleBox(),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: PurpleBox(),
          ),
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
        child: Text("flex"),
      ),
    );
  }
}

class PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.purple,
        border: Border.all(),
      ),
      child: const Center(
        child: Text("flex"),
      ),
    );
  }
}
