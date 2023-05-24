import 'package:flutter/material.dart';

void main() => runApp(const AnimatedAlignApp());

class AnimatedAlignApp extends StatelessWidget {
  const AnimatedAlignApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("AnimatedAlignApp"))),
        body: const AnimatedAlignAppDemo(),
      ),
    );
  }
}

class AnimatedAlignAppDemo extends StatefulWidget {
  const AnimatedAlignAppDemo({super.key});
  @override
  State<AnimatedAlignAppDemo> createState() => _AnimatedAlignAppDemoState();
}

class _AnimatedAlignAppDemoState extends State<AnimatedAlignAppDemo> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: 250, height: 250, color: Colors.amber,

// ANIMATED ALIGN
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: const FlutterLogo(size: 50),
          ),
        ),
      ),
    );
  }
}
