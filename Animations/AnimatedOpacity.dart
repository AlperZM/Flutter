import 'package:flutter/material.dart';

void main() => runApp(const AOpacityApp());

class AOpacityApp extends StatefulWidget {
  const AOpacityApp({super.key});
  @override
  State<AOpacityApp> createState() => _AOpacityAppState();
}

class _AOpacityAppState extends State<AOpacityApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("AnimatedOpacity App")),
          actions: <Widget>[
            Center(
              child: Text(
                isDark ? "LIGHT" : "DARK",
                style: TextStyle(
                    fontSize: 20,
                    color: isDark ? Colors.amberAccent : Colors.black),
              ),
            ),
            const SizedBox(width: 15),
            Switch(
                value: isDark,
                activeColor: Colors.amber,
                onChanged: (bool value) {
                  setState(() {
                    isDark = !isDark;
                  });
                }),
          ],
        ),
        body: const Center(child: AOpacityClass()),
      ),
    );
  }
}

class AOpacityClass extends StatefulWidget {
  const AOpacityClass({super.key});
  @override
  State<AOpacityClass> createState() => _AOpacityClassState();
}

class _AOpacityClassState extends State<AOpacityClass> {
  double _currentOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
            curve: Curves.bounceIn,
            duration: const Duration(seconds: 2),
            opacity: _currentOpacity,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: const Center(
                child: Icon(
                  Icons.flutter_dash_outlined,
                  size: 70,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text("AnimatedOpacity"),
            onPressed: () {
              setState(
                () => _currentOpacity = _currentOpacity == 1.0 ? 0.0 : 1.0,
              );
            },
          ),
        ],
      ),
    );
  }
}
