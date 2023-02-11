import 'package:flutter/material.dart';

void main() => runApp(const ScaleApp());

class ScaleApp extends StatefulWidget {
  const ScaleApp({super.key});
  @override
  State<ScaleApp> createState() => _ScaleAppState();
}

class _ScaleAppState extends State<ScaleApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("ScaleTransition App")),
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
        body: const Center(child: ScaleTransitionApp()),
      ),
    );
  }
}

class ScaleTransitionApp extends StatefulWidget {
  const ScaleTransitionApp({super.key});
  @override
  State<ScaleTransitionApp> createState() => _ScaleTransitionAppState();
}

class _ScaleTransitionAppState extends State<ScaleTransitionApp>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
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
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.open_with_outlined,
              size: 190,
            )),
      ),
    );
  }
}
