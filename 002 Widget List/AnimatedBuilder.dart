import 'package:flutter/material.dart';

void main() => runApp(const AnimatedBuilderApp());

class AnimatedBuilderApp extends StatelessWidget {
  const AnimatedBuilderApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("AnimatedBuilder App"),
        ),
        body: const AnimatedBuilderDemo(),
      ),
    );
  }
}

class AnimatedBuilderDemo extends StatefulWidget {
  const AnimatedBuilderDemo({super.key});
  @override
  State<AnimatedBuilderDemo> createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1),
            ),
          ),
        ),
        AnimatedBuilder(
            animation: _controller,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * -2 * 3.14,
                child: child,
              );
            }),
        AnimatedBuilder(
            animation: _controller,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: FlutterLogo(size: 60)),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2 * 3.14,
                child: child,
              );
            }),
      ],
    );
  }
}
