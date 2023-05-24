import 'package:flutter/material.dart';

void main() => runApp(const AnimatedPaddingApp());

class AnimatedPaddingApp extends StatelessWidget {
  const AnimatedPaddingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("AnimatedPaddingApp"))),
        body: const AnimatedPaddingAppDemo(),
      ),
    );
  }
}

class AnimatedPaddingAppDemo extends StatefulWidget {
  const AnimatedPaddingAppDemo({super.key});
  @override
  State<AnimatedPaddingAppDemo> createState() => _AnimatedPaddingAppDemoState();
}

class _AnimatedPaddingAppDemoState extends State<AnimatedPaddingAppDemo> {
  double padValue = 0.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedPadding(
          padding: EdgeInsets.all(padValue),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.blue,
          ),
        ),
        ElevatedButton(
          child: Text("The Padding: $padValue"),
          onPressed: () {
            _updatePadding(padValue == 0.0 ? 100.0 : 0.0);
          },
        ),
      ],
    );
  }
}
