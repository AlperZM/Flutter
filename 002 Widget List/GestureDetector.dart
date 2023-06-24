import 'package:flutter/material.dart';

void main() => runApp(const Gestures());

class Gestures extends StatelessWidget {
  const Gestures({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Gestures"))),
        body: const AppBody(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  bool lightOn = false;
  Color _color = Colors.blue;
  bool dTap = false;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 3,
      children: <Widget>[
//------>Gesture onTap
        Container(
          color: lightOn ? Colors.amber[100] : Colors.grey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text("Gesture onTap"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: lightOn ? Colors.yellow.shade600 : Colors.black,
                    size: 60,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      lightOn = !lightOn;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    child: Text(lightOn ? "Turn Off" : "Turn On"),
                  ),
                ),
              ]),
        ),
//--------> Gesture onTap 2
        Container(
          color: _color,
          height: 200.0,
          width: 200.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _color == Colors.blue
                    ? _color = Colors.red
                    : _color = Colors.blue;
              });
            },
          ),
        ),

//-------> gesture onDoubleTap
        Container(
          color: dTap ? Colors.red[100] : Colors.green[100],
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text("Gesture onDobleTap"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lightbulb_outline_sharp,
                    color: dTap ? Colors.red : Colors.green,
                    size: 60,
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      dTap = !dTap;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    child: Text(dTap ? "Double Tap Off" : "Double Tap On"),
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
