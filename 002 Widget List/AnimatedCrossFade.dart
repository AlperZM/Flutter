import 'package:flutter/material.dart';

void main() => runApp(const AnimatedCrossFadeApp());

class AnimatedCrossFadeApp extends StatefulWidget {
  const AnimatedCrossFadeApp({super.key});
  @override
  State<AnimatedCrossFadeApp> createState() => _AnimatedCrossFadeAppState();
}

class _AnimatedCrossFadeAppState extends State<AnimatedCrossFadeApp> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("AnimatedCrossFadeApp"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedCrossFade(
                duration: const Duration(seconds: 3),
                firstChild: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 100.0),
                secondChild: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 100.0),
                crossFadeState: _first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              const SizedBox(height: 10),
              AnimatedCrossFade(
                crossFadeState: _first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 2),
                firstChild: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Icon(Icons.question_mark, size: 60),
                ),
                secondChild: Container(
                  width: 200,
                  height: 100,
                  color: Colors.green,
                  child: const Icon(Icons.check_circle_outlined, size: 60),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedCrossFade(
                crossFadeState: _first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 2),
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeIn,
                sizeCurve: Curves.bounceOut,
                firstChild: Container(
                  width: 100,
                  height: 50,
                  color: Colors.amber,
                  child: const Center(
                    child: Text("Hello", style: TextStyle(fontSize: 30)),
                  ),
                ),
                secondChild: Container(
                  width: 150,
                  height: 100,
                  color: Colors.teal,
                  child: const Center(
                    child: Text("Goodbye", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  child: const Text("Switch Fade"),
                  onPressed: () {
                    setState(() {
                      _first = !_first;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
