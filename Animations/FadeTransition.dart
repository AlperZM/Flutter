import 'package:flutter/material.dart';

void main() => runApp(const FadeTransitionApp());

class FadeTransitionApp extends StatefulWidget {
  const FadeTransitionApp({super.key});
  @override
  State<FadeTransitionApp> createState() => _FadeTransitionAppState();
}

class _FadeTransitionAppState extends State<FadeTransitionApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("FadeTransition App")),
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
        body: const Center(child: FadeApp()),
      ),
    );
  }
}

class FadeApp extends StatefulWidget {
  const FadeApp({super.key});
  @override
  State<FadeApp> createState() => _FadeAppState();
}

class _FadeAppState extends State<FadeApp> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
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
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.cyan,
          child:
              const Icon(Icons.star_outlined, size: 150, color: Colors.amber),
        ),
      ),
    );
  }
}
