import 'package:flutter/material.dart';

void main() => runApp(const FadeTransitionApp());

class FadeTransitionApp extends StatelessWidget {
  const FadeTransitionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("FadeTransitionApp"))),
        body: const Center(child: FadeTransitionDemo()),
      ),
    );
  }
}

class FadeTransitionDemo extends StatefulWidget {
  const FadeTransitionDemo({super.key});
  @override
  State<FadeTransitionDemo> createState() => _FadeTransitionDemoState();
}

class _FadeTransitionDemoState extends State<FadeTransitionDemo>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.amberAccent,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: FlutterLogo(size: 80),
        ),
      ),
    );
  }
}
