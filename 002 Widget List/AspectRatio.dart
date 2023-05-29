import 'package:flutter/material.dart';

void main() => runApp(const AspectRatioApp());

class AspectRatioApp extends StatelessWidget {
  const AspectRatioApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("ApectRatioApp")),
        ),
        body: const AspectRatioDemo(),
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text("aspectRatio: 16 / 9"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            alignment: Alignment.center,
            child: AspectRatio(
                aspectRatio: 4 / 5,
                child: Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text("aspectRatio: 4 / 5"),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
