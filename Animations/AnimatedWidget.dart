import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const AnimateWidget());

class AnimateWidget extends StatefulWidget {
  const AnimateWidget({super.key});
  @override
  State<AnimateWidget> createState() => _AnimateWidgetState();
}

class _AnimateWidgetState extends State<AnimateWidget> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("AnimatedWidget App")),
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
        body: const Center(
          child: AnimationWidget(),
        ),
      ),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});
  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text("Simple Sipinning Animated Widget"),
              SizedBox(height: 15),
              AnimatedWidgetBsic(),
            ],
          ),
        ],
      ),
    );
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({super.key, required AnimationController controller})
      : super(listenable: controller);
  Animation<double> get _progress => listenable as Animation<double>;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2 * math.pi,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.greenAccent,
      ),
    );
  }
}

class AnimatedWidgetBsic extends StatefulWidget {
  const AnimatedWidgetBsic({super.key});
  @override
  State<AnimatedWidgetBsic> createState() => _AnimatedWidgetBsicState();
}

class _AnimatedWidgetBsicState extends State<AnimatedWidgetBsic>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext contex) {
    return SpinningContainer(controller: _controller);
  }
}
