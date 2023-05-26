import 'package:flutter/material.dart';

void main() => runApp(const AnimatedContainerApp());

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});
  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  bool selected = false;
  int time = 2;
  var cols = Colors.red;
  double wi = 200.0;
  double hei = 100.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("AnimatedContainer App"))),
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedContainer(
                  width: wi,
                  height: hei,
                  color: cols,
                  alignment: selected
                      ? Alignment.center
                      : AlignmentDirectional.topCenter,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text("Switch Width: 200 / 100"),
                  onPressed: () {
                    setState(() {
                      wi == 200.0 ? wi = 100.0 : wi = 200.0;
                    });
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text("Switch height: 200 / 100"),
                  onPressed: () {
                    setState(() {
                      hei == 200.0 ? hei = 100.0 : hei = 200.0;
                    });
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text("Switch Color: red / blue"),
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                      cols = selected ? Colors.blue : Colors.red;
                    });
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text("Switch duration: 2 / 1"),
                  onPressed: () {
                    setState(() {
                      time == 2 ? time = 1 : time = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
