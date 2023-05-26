import 'package:flutter/material.dart';

void main() => runApp(const AnimatedSwitcherApp());

class AnimatedSwitcherApp extends StatefulWidget {
  const AnimatedSwitcherApp({super.key});
  @override
  State<AnimatedSwitcherApp> createState() => _AnimatedSwitcherAppState();
}

class _AnimatedSwitcherAppState extends State<AnimatedSwitcherApp> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("AnimatedSwitcherApp"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  "$_count",
                  style: const TextStyle(fontSize: 25, color: Colors.indigo),
                  key: ValueKey<int>(_count),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Increment"),
                onPressed: () {
                  setState(() {
                    _count += 1;
                  });
                },
              ),
              const SizedBox(height: 10),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(turns: animation, child: child);
                },
                child: Text(
                  "$_count",
                  style: const TextStyle(fontSize: 35, color: Colors.pink),
                  key: ValueKey<int>(_count),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Decrement"),
                onPressed: () {
                  setState(() {
                    _count -= 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
