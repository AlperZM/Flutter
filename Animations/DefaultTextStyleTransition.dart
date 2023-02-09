import 'package:flutter/material.dart';

void main() => runApp(const TextAnimation());

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});
  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("TextAnimation App")),
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
        body: const Center(child: TextAnimationStyle()),
      ),
    );
  }
}

class TextAnimationStyle extends StatefulWidget {
  const TextAnimationStyle({super.key});
  @override
  State<TextAnimationStyle> createState() => _TextAnimationStyleState();
}

class _TextAnimationStyleState extends State<TextAnimationStyle>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late TextStyleTween _styleTween;
  late CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _styleTween = TextStyleTween(
      begin: const TextStyle(
          fontSize: 50, color: Colors.blue, fontWeight: FontWeight.bold),
      end: const TextStyle(
          fontSize: 20, color: Colors.red, fontWeight: FontWeight.w100),
    );
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyleTransition(
        style: _styleTween.animate(_curvedAnimation),
        child: const Text("DefaultTextStyleTransition"),
      ),
    );
  }
}
