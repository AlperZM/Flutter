import 'package:flutter/material.dart';

void main() => runApp(const APositionApp());

class APositionApp extends StatefulWidget {
  const APositionApp({super.key});
  @override
  State<APositionApp> createState() => _APositionAppState();
}

class _APositionAppState extends State<APositionApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("AnimatedPosition App")),
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
        body: const Center(child: AnimatedPositionClass()),
      ),
    );
  }
}

class AnimatedPositionClass extends StatefulWidget {
  const AnimatedPositionClass({super.key});
  @override
  State<AnimatedPositionClass> createState() => _AnimatedPositionClassState();
}

class _AnimatedPositionClassState extends State<AnimatedPositionClass> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.secondary),
        ),
        width: 300,
        height: 300,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              width: selected ? 200 : 50,
              height: selected ? 50 : 200,
              top: selected ? 0 : 150,
              left: selected ? 100 : 0,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () {
                  setState(
                    () => selected = !selected,
                  );
                },
                child: Container(
                    color: Colors.deepOrange,
                    child: const Center(
                      child: Icon(
                        Icons.touch_app_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
