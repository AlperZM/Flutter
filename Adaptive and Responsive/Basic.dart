// simply id screen size is bigger than 600 shows row, else shows column
import 'package:flutter/material.dart';

void main() => runApp(const RespApp());

class RespApp extends StatefulWidget {
  const RespApp({super.key});
  @override
  State<RespApp> createState() => _RespAppState();
}

class _RespAppState extends State<RespApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return _buildWide();
        } else {
          return _buildSmall();
        }
      }),
    );
  }
}

Widget _buildWide() {
  return Scaffold(
      appBar: AppBar(title: const Center(child: Text("WideScreen"))),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      )));
}

Widget _buildSmall() {
  return Scaffold(
    appBar: AppBar(title: const Center(child: Text("SmallScreen"))),
    body: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
        ),
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.yellow,
        ),
      ],
    )),
  );
}
