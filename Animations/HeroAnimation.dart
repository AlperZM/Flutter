import 'package:flutter/material.dart';

void main() => runApp(const HeroApp());

class HeroApp extends StatefulWidget {
  const HeroApp({super.key});
  @override
  State<HeroApp> createState() => _HeroAppState();
}

class _HeroAppState extends State<HeroApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Hero App")),
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
        body: const Center(child: HeroClass()),
      ),
    );
  }
}

class HeroClass extends StatefulWidget {
  const HeroClass({super.key});
  @override
  State<HeroClass> createState() => _HeroClassState();
}

class _HeroClassState extends State<HeroClass> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: const Hero(
              tag: "hero-1",
              child: BoxWidget(size: Size(50, 50), color: Colors.blue),
            ),
            onTap: () => _gotoBluePage(context),
            title: const Text("Go to Blue page"),
          ),
          ListTile(
            leading: const Hero(
              tag: "hero-2",
              child: BoxWidget(size: Size(50, 50), color: Colors.red),
            ),
            onTap: () => _gotoRedPage(context),
            title: const Text("Go to Red page"),
          ),
          ListTile(
            leading: const Hero(
              tag: "hero-3",
              child: BoxWidget(size: Size(50, 50), color: Colors.green),
            ),
            onTap: () => _gotoGreenPage(context),
            title: const Text("Go to Green page"),
          ),
        ],
      ),
    );
  }
}

void _gotoBluePage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Blue Page"),
      ),
      body: const Center(
        child: Hero(
          tag: "Hero-1",
          child: BoxWidget(size: Size(200, 200), color: Colors.blue),
        ),
      ),
    ),
  ));
}

void _gotoRedPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Red Page"),
      ),
      body: const Center(
        child: Hero(
          tag: "Hero-1",
          child: BoxWidget(size: Size(250, 250), color: Colors.red),
        ),
      ),
    ),
  ));
}

void _gotoGreenPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Red Page"),
      ),
      body: const Center(
        child: Hero(
          tag: "Hero-1",
          child: BoxWidget(size: Size(250, 250), color: Colors.red),
        ),
      ),
    ),
  ));
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
