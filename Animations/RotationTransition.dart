import 'package:flutter/material.dart';

void main() => runApp(const RotationApp());

class RotationApp extends StatefulWidget {
  const RotationApp({super.key});
  @override
  State<RotationApp> createState() => _RotationAppState();
}

class _RotationAppState extends State<RotationApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("RotationTranslate App")),
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
        body: const Center(child: RotationTranslateApp()),
      ),
    );
  }
}

class RotationTranslateApp extends StatefulWidget {
  const RotationTranslateApp({super.key});
  @override
  State<RotationTranslateApp> createState() => _RotationTranslateAppState();
}

class _RotationTranslateAppState extends State<RotationTranslateApp>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _animation,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.settings_outlined,
              size: 60, color: Colors.white),
        ),
      ),
    );
  }
}
