import 'package:flutter/material.dart';

void main() => runApp(const ClipApp());

class ClipApp extends StatelessWidget {
  const ClipApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("ClipApp"))),
        body: const Center(child: AppDemo()),
      ),
    );
  }
}

class AppDemo extends StatelessWidget {
  const AppDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.5,
                  child: FlutterLogo(size: 50),
                ),
              ),
              Text("ClipRect"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipOval(
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.amber[200],
                  child: const FlutterLogo(size: 80),
                ),
              ),
              const Text("ClipOval"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(50),
                ),
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.amber[200],
                  child: const FlutterLogo(size: 80),
                ),
              ),
              const Text("ClipRRect"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 90,
                ),
              ),
              const Text("ClipPath"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipPath(
                clipper: MyClipper2(),
                child: Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 90.0,
                ),
              ),
              const Text("ClipPath2"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipPath(
                clipper: MyClipper3(),
                child: Container(
                  color: Colors.orange,
                  width: double.infinity,
                  height: 90.0,
                ),
              ),
              const Text("ClipPath3"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    child: ClipPath(
                      clipper: MyClipper3(),
                      child: Container(
                        color: Colors.cyan,
                        width: double.infinity,
                        height: 90.0,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 10,
                    top: 40,
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      child: Center(child: FlutterLogo(size: 40)),
                    ),
                  ),
                ],
              ),
              const Text("ClipPath4"),
            ],
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(MyClipper oldClipper) => false;
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(MyClipper2 oldClipper) => false;
}

class MyClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 60, size.width / 2, size.height - 30);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 90);
    return path;
  }

  @override
  bool shouldReclip(MyClipper3 oldClipper) => false;
}
