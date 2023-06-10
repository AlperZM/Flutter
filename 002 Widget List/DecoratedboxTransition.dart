import 'package:flutter/material.dart';

void main() => runApp(const DecoratedBoxApp());

class DecoratedBoxApp extends StatelessWidget {
  const DecoratedBoxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("DecoratedBoxApp"))),
        body: const Center(child: DecoratedBoxDemo()),
      ),
    );
  }
}

class DecoratedBoxDemo extends StatefulWidget {
  const DecoratedBoxDemo({super.key});
  @override
  State<DecoratedBoxDemo> createState() => _DecoratedBoxDemoState();
}

class _DecoratedBoxDemoState extends State<DecoratedBoxDemo>
    with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.blueAccent,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.blueGrey,
          blurRadius: 10,
          spreadRadius: 3,
          offset: Offset(0, 6),
        ),
      ],
    ),
    end: BoxDecoration(
      color: Colors.greenAccent,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.zero,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.tealAccent,
          blurRadius: 5,
          spreadRadius: 5,
          offset: Offset(6, 0),
        ),
      ],
    ),
  );
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: DecoratedBoxTransition(
            decoration: decorationTween.animate(_controller),
            child: Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(10),
              child: const FlutterLogo(),
            )),
      ),
    );
  }
}
