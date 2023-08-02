import 'package:flutter/material.dart';

void main() => runApp(const ScaleTransitionApp());

class ScaleTransitionApp extends StatelessWidget {
  const ScaleTransitionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("ScaleTransitionApp"))),
        body: const Center(child: ScaleTransitionDemo()),
      ),
    );
  }
}

class ScaleTransitionDemo extends StatefulWidget {
  const ScaleTransitionDemo({super.key});
  @override
  State<ScaleTransitionDemo> createState() => _ScaleTransitionDemoState();
}

class _ScaleTransitionDemoState extends State<ScaleTransitionDemo>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: const FlutterLogo(size: 100),
    );
  }
}
