// allways use alingment: Alignment... property
import 'package:flutter/material.dart';

void main() => runApp(AspectRatioApp());

class AspectRatioApp extends StatefulWidget {
  @override
  State<AspectRatioApp> createState() => _AspectRatioAppState();
}

class _AspectRatioAppState extends State<AspectRatioApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("AspecRatio"))),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,

          
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
                color: Colors.teal, child: const Text("AspectRatio: 16 / 9")),
          ),

          
        ),
      ),
    );
  }
}
