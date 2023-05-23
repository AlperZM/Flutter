import 'package:flutter/material.dart';

void main() => runApp(const AlignApp());

class AlignApp extends StatelessWidget {
  const AlignApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("Align (Fractional) App"))),
        body: const Center(child: AlignDemos()),
      ),
    );
  }
}

class AlignDemos extends StatelessWidget {
  const AlignDemos({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(
                  width: 200,
                  height: 150,
                  child: Align(
                    alignment: FractionalOffset(0.5, 0.5),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("FractionalOffset(0.5,0.5),")),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(
                  width: 200,
                  height: 150,
                  child: Align(
                    alignment: FractionalOffset(0.9, 0.9),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("FractionalOffset(0.9, 0.0),")),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(
                  width: 200,
                  height: 150,
                  child: Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("FractionalOffset(0.2, 0.6),")),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(
                  width: 200,
                  height: 150,
                  child: Align(
                    alignment: FractionalOffset(1, 1),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("FractionalOffset(1,1)")),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(
                  width: 200,
                  height: 150,
                  child: Align(
                    alignment: FractionalOffset(0.1, 0.9),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("FractionalOffset(0.1,0.9)")),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(
                  width: 200,
                  height: 150,
                  child: Align(
                    alignment: FractionalOffset(0.9, 0.1),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("FractionalOffset(0.9, 0.1)")),
              ],
            ),
          ),
        ]);
  }
}
