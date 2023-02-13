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
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Curves.fastOutSlowIn"),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected1 = !selected1;
                  });
                },
                child: Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    color: Colors.red,
                    child: AnimatedAlign(
                      alignment:
                          selected1 ? Alignment.topRight : Alignment.bottomLeft,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Curves.easeInOut"),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected2 = !selected2;
                  });
                },
                child: Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    color: Colors.green,
                    child: AnimatedAlign(
                      alignment: selected2
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Curves.easeOutCubic"),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => setState(() => selected3 = !selected3),
                child: Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: AnimatedAlign(
                      alignment: selected3
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOutCubic,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: selected3 ? Colors.lime : Colors.indigo,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: selected3
                            ? const Icon(Icons.arrow_circle_down_outlined,
                                size: 30)
                            : const Icon(Icons.arrow_upward_outlined, size: 30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
