import 'package:flutter/material.dart';

void main() => runApp(const SizeTransitionApp());

class SizeTransitionApp extends StatefulWidget {
  const SizeTransitionApp({super.key});
  @override
  State<SizeTransitionApp> createState() => _SizeTransitionAppState();
}

class _SizeTransitionAppState extends State<SizeTransitionApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("SizeTransition App")),
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
        body: const Center(child: SizeApp()),
      ),
    );
  }
}

class SizeApp extends StatefulWidget {
  const SizeApp({super.key});
  @override
  State<SizeApp> createState() => _SizeAppState();
}

class _SizeAppState extends State<SizeApp> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.vertical,
      axisAlignment: -1,
      child: const Center(
        child: FlutterLogo(size: 200.0),
      ),
    );
  }
}
