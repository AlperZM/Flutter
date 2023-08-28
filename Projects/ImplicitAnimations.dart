import 'package:flutter/material.dart';
import 'dart:math';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';

void main() => runApp(const ImplicitAnimation1());

class ImplicitAnimation1 extends StatelessWidget {
  const ImplicitAnimation1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
//       home: const AnimatedContainerDemo(),
        routes: {
          "/": (context) => const FadeInDemo(),
          "animated": (context) => const AnimatedContainerDemo(),
        });
  }
}

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0;
  bool click = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("FadeIn"))),
      body: Row(
        children: <Widget>[
          const SideMenu(),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(owlUrl, height: height * 0.5),
                TextButton(
                  child: const Text(
                    'Show Details',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () => {
                    setState(() {
                      click = !click;
                      click ? opacity = 1 : opacity = 0;
                    })
                  },
                ),
                AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(seconds: 2),
                    child: const Column(
                      children: [
                        Text('Type: Owl'),
                        Text('Age: 39'),
                        Text('Employment: None'),
                      ],
                    ))
              ])
        ],
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      width: 80,
      height: double.infinity,
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          const Text("Menu",
              style: TextStyle(fontSize: 18, color: Colors.white)),
          const SizedBox(height: 10),
          TextButton(
            child: const Text("FadeIn"),
            onPressed: () {
              Navigator.of(context).pushNamed("/");
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            child: const Text("Random"),
            onPressed: () {
              Navigator.of(context).pushNamed("/animated");
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  double randomBorderRadius() => Random().nextDouble() * 64;
  double randomMargin() => Random().nextDouble() * 64;
  Color randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Center(child: Text("RandomAnimatedContainer"))),
      body: Row(
        children: <Widget>[
          const SideMenu(),
          Column(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    margin: EdgeInsets.all(margin),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Change'),
                onPressed: () => change(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
