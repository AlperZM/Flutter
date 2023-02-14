import 'package:flutter/material.dart';

void main() => runApp(const ACrossFadeApp());

class ACrossFadeApp extends StatefulWidget {
  const ACrossFadeApp({super.key});
  @override
  State<ACrossFadeApp> createState() => _ACrossFadeAppState();
}

class _ACrossFadeAppState extends State<ACrossFadeApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("AnimatedCrossFade App")),
          actions: <Widget>[
            Center(
              child: Text(
                isDark ? "LIGHT" : "DARK",
                style: TextStyle(
                    fontSize: 20,
                    color: isDark ? Colors.amberAccent : Colors.black),
              ),
            ),
            const SizedBox(height: 15),
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
        body: const Center(child: ACrossFade()),
      ),
    );
  }
}

class ACrossFade extends StatefulWidget {
  const ACrossFade({super.key});
  @override
  State<ACrossFade> createState() => _ACrossFadeState();
}

class _ACrossFadeState extends State<ACrossFade> {
  bool _first = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState:
                _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: FlutterLogo(
                      style: FlutterLogoStyle.horizontal, size: 100.0),
                )),
            secondChild: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child:
                      FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
                )),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text("AnimatedCrossFade"),
            onPressed: () => setState(() => _first = !_first),
          ),
        ],
      ),
    );
  }
}
