import 'package:flutter/material.dart';

void main() => runApp(const CoreApp());

class CoreApp extends StatelessWidget {
  const CoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (context) => const Home(),
    });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Basic Flutter Layout"))),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: 80,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Colors.black54,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Menu",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "How To Use This Tutorial?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                const Text("""To navigation beween layout models, use menu bar.
              Each page has some explanations about layout widgets.
              For Example this page uses "Column", "Row", "Text"...
              """, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
