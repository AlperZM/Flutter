import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Wrap"))),
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.spaceBetween,
      runSpacing: 4,
      spacing: 4,
      children: <Widget>[
        myBox(context),
        myBox(context),
        myBox(context),
        myBox(context),
        myBox(context),
        myBox(context),
        myBox(context),
        myBox(context),
        myBox(context),
        myBox(context),
      ],
    );
  }
}

Widget myBox(BuildContext context) {
  Color color = Colors.red;
  return Container(
    width: 100,
    height: 100,
    color: color,
  );
}
