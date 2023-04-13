import 'package:flutter/material.dart';

void main() => runApp(const HomePageApp());

class HomePageApp extends StatefulWidget {
  const HomePageApp({super.key});
  @override
  State<HomePageApp> createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              semanticLabel: "Menu",
            ),
          ),
          title: const Center(child: Text("SHRINE")),
          actions: <Widget>[
            const SizedBox(width: 15),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, semanticLabel: "Search"),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune, semanticLabel: "Filter"),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: isDark
                  ? const Icon(Icons.light_mode, color: Colors.amber)
                  : const Icon(Icons.dark_mode, color: Colors.black54),
            ),
          ],
        ),
        body: const Center(child: HomePageClass()),
      ),
    );
  }
}

class HomePageClass extends StatefulWidget {
  const HomePageClass({super.key});
  @override
  State<HomePageClass> createState() => _HomePageClassState();
}

class _HomePageClassState extends State<HomePageClass> {
  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
