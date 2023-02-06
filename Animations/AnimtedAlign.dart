import 'package:flutter/material.dart';

void main() => runApp(const AnimateAlign());

class AnimateAlign extends StatefulWidget {
  const AnimateAlign({super.key});
  @override
  State<AnimateAlign> createState() => _AnimateAlignState();
}

class _AnimateAlignState extends State<AnimateAlign> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("AnimatedAlign App")),
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
        body: const Center(
          child: AnimationAlign(),
        ),
      ),
    );
  }
}

class AnimationAlign extends StatefulWidget {
  const AnimationAlign({super.key});
  @override
  State<AnimationAlign> createState() => _AnimationAlignState();
}

class _AnimationAlignState extends State<AnimationAlign> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: Container(
                width: 250,
                height: 250,
                color: Colors.red,
                child: AnimatedAlign(
                  alignment:
                      selected ? Alignment.topRight : Alignment.bottomLeft,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

