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
            child: BoxWidget(size: Size(50.0, 50.0), color: Colors.blue),
          ),
          onTap: () => _gotoDetailsPage(context),
          title:
              const Text('Tap on the icon to view hero animation transition.'),
        ),
        const SizedBox(height: 20.0),
        ListTile(
            leading: const Hero(
              tag: "hero-red",
              child: BoxWidget(size: Size(50, 50), color: Colors.red),
            ),
            onTap: () => _gotoRedPage(context),
            title: const Text("Second Hero Widget")),
        const SizedBox(height: 20.0),
        ListTile(
          leading: const Hero(
            tag: "hero-flutter",
            child: FlutterLogo(size: 50),
          ),
          onTap: () => _flutterLogoPage(context),
          title: const Text("FlutterLogo as a hero horizontal"),
        ),
        const SizedBox(height: 20.0),
        ListTile(
          leading: const Hero(
            tag: "hero-flutter2",
            child: FlutterLogo(size: 50),
          ),
          onTap: () => _flutterLogoPage2(context),
          title: const Text("FlutterLogo 2"),
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
            child: BoxWidget(size: Size(200, 200), color: Colors.blue),
          ),
        ),
      ),
    ));
  }

  void _gotoRedPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(title: const Center(child: Text("HeroDetails red"))),
        body: const Center(
          child: Hero(
            tag: "her-red",
            child: BoxWidget(size: Size(200, 200), color: Colors.red),
          ),
        ),
      ),
    ));
  }

  void _flutterLogoPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Flutter Logo horizontal")),
        body: Center(
          child: Hero(
            tag: "hero-flutter",
            child: Container(
              width: 200,
              height: 200,
              color: Colors.orange[100],
              child: const FlutterLogo(
                  size: 100, style: FlutterLogoStyle.horizontal),
            ),
          ),
        ),
      );
    }));
  }

  void _flutterLogoPage2(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Flutter Logo 2")),
        body: const Center(
          child: FlutterLogo(size: 150, style: FlutterLogoStyle.stacked),
        ),
      );
    }));
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.size, required this.color});
  final Size size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: color,
    );
  }
}
