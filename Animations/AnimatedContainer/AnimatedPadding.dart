import 'package:flutter/material.dart';

void main() => runApp(const APaddingApp());

class APaddingApp extends StatefulWidget {
  const APaddingApp({super.key});
  @override
  State<APaddingApp> createState() => _APaddingAppState();
}

class _APaddingAppState extends State<APaddingApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Basic Template App")),
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
        body: const Center(child: AnimatedPaddingApp()),
      ),
    );
  }
}

class AnimatedPaddingApp extends StatefulWidget {
  const AnimatedPaddingApp({super.key});
  @override
  State<AnimatedPaddingApp> createState() => _AnimatedPaddingAppState();
}

class _AnimatedPaddingAppState extends State<AnimatedPaddingApp> {
  double padValue = 0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedPadding(
              padding: EdgeInsets.all(padValue),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: padValue == 0 ? Colors.blue : Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          Text("Padding: $padValue"),
          const SizedBox(height: 15),
          ElevatedButton(
              child: const Text("Change Padding"),
              onPressed: () {
                _updatePadding(padValue == 0 ? 100 : 0);
              }),
        ],
      ),
    );
  }
}
