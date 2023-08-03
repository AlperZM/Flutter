import 'package:flutter/material.dart';

void main() => runApp(const SlideTransitionApp());

class SlideTransitionApp extends StatelessWidget {
  const SlideTransitionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("SlideTransitionApp")),
        body: const Center(child: AppBody()),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> with TickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _ctrl,
    curve: Curves.elasticInOut,
  ));
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _offsetAnimation,
        child: const FlutterLogo(size: 100),
      ),
    );
  }
}
