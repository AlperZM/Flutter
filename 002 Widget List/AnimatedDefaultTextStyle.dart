import 'package:flutter/material.dart';

void main() => runApp(const AnimatedTextStyleApp());

class AnimatedTextStyleApp extends StatefulWidget {
  const AnimatedTextStyleApp({super.key});
  @override
  State<AnimatedTextStyleApp> createState() => _AnimatedTextStyleAppState();
}

class _AnimatedTextStyleAppState extends State<AnimatedTextStyleApp>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late TextStyleTween _styleTween;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _styleTween = TextStyleTween(
      begin: const TextStyle(
        fontSize: 80,
        color: Colors.amber,
        fontWeight: FontWeight.w900,
      ),
      end: const TextStyle(
        fontSize: 50,
        color: Colors.teal,
        fontWeight: FontWeight.w100,
      ),
    );
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("AnimatedTextStyleApp")),
        ),
        body: Center(
          child: DefaultTextStyleTransition(
            style: _styleTween.animate(_curvedAnimation),
            child: const Text("Flutter"),
          ),
        ),
      ),
    );
  }
}
