import 'package:flutter/material.dart';

void main() => runApp(const HeroApp());

class HeroApp extends StatelessWidget {
  const HeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Hero Sample'))),
        body: const HeroExample(),
      ),
    );
  }
}

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20.0),
        ListTile(
          leading: const Hero(
            tag: "hero-rectangle-blue",
            child: BoxWidget(size: Size(50.0, 50.0)),
          ),
          onTap: () => _gotoDetailsPage(context),
          title:
              const Text('Tap on the icon to view hero animation transition.'),
        ),
      ],
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(title: const Center(child: Text("HeroDetails"))),
        body: const Center(
          child: Hero(
            tag: "hero-rectangle-blue",
            child: BoxWidget(size: Size(200, 200)),
          ),
        ),
      ),
    ));
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}
