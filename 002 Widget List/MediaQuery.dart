import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("MediaQuery"))),
        body: Center(
          child: AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Container(
      color: Colors.amber,
      width: screenWidth / 2,
      height: screenHeight / 3,
      child:
          Center(child: Text("$screenSize // $screenWidth // $screenHeight")),
    );
  }
}
