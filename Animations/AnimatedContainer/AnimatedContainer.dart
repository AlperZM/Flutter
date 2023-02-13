import 'package:flutter/material.dart';

void main() => runApp(const AContainerApp());

class AContainerApp extends StatefulWidget {
  const AContainerApp({super.key});
  @override
  State<AContainerApp> createState() => _AContainerAppState();
}

class _AContainerAppState extends State<AContainerApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("AnimatedContainer App")),
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
        body: const Center(child: AnimatedCon()),
      ),
    );
  }
}

class AnimatedCon extends StatefulWidget {
  const AnimatedCon({super.key});
  @override
  State<AnimatedCon> createState() => _AnimatedConState();
}

class _AnimatedConState extends State<AnimatedCon> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 200 : 100,
            height: selected ? 100 : 200,
            color: selected ? Colors.red : Colors.blue,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.center,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: selected
                ? const Icon(Icons.settings_ethernet_outlined, size: 30)
                : const Icon(Icons.expand_outlined, size: 30),
          ),
        ),
      ),
    );
  }
}
