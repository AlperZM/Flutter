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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text("AlignTransition Widget"),
              SizedBox(height: 15),
              AlignTransitionBsic(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text("DecoratedboxTransition Widget"),
              SizedBox(height: 15),
              DecoratedBoxTransitionBasic(),
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

class AlignTransitionBsic extends StatefulWidget {
  const AlignTransitionBsic({super.key});
  @override
  State<AlignTransitionBsic> createState() => _AlignTransitionBsicState();
}

class _AlignTransitionBsicState extends State<AlignTransitionBsic>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linearToEaseOut,
    ),
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.brown,
      child: AlignTransition(
        alignment: _animation,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}

class DecoratedBoxTransitionBasic extends StatefulWidget {
  const DecoratedBoxTransitionBasic({super.key});
  @override
  State<DecoratedBoxTransitionBasic> createState() =>
      _DecoratedBoxTransitionBasicState();
}

class _DecoratedBoxTransitionBasicState
    extends State<DecoratedBoxTransitionBasic> with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.teal,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.grey,
          blurRadius: 10,
          spreadRadius: 3,
          offset: Offset(0, 6),
        ),
      ],
    ),
    end: BoxDecoration(
      color: Colors.tealAccent,
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
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
    return Center(
      child: DecoratedBoxTransition(
        decoration: decorationTween.animate(_controller),
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(10),
          child: const Center(child: Text("DecoratedBoxTransition")),
        ),
      ),
    );
  }
}
