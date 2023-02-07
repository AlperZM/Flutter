import 'package:flutter/material.dart';

void main() => runApp(const TextApp());

class TextApp extends StatefulWidget {
  const TextApp({super.key});
  @override
  State<TextApp> createState() => _TextAppState();
}

class _TextAppState extends State<TextApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("TextApp")),
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
          child: DemoTextApp(),
        ),
      ),
    );
  }
}

class DemoTextApp extends StatefulWidget {
  const DemoTextApp({super.key});
  @override
  State<DemoTextApp> createState() => _DemoTextAppState();
}

class _DemoTextAppState extends State<DemoTextApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "This is a default Text",
                  textAlign: TextAlign.center,
                ),
                SelectionContainer.disabled(
                    child: Text("This is nonSelectable"))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text("This text icludes: fontSize, color, fontWeight",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(15),
            ),
            child: RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "RichText\n", style: TextStyle(fontSize: 20)),
                  TextSpan(
                      text: "TextSpan\n", style: TextStyle(color: Colors.red)),
                  TextSpan(
                      text: "text: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "custom text",
                      style: TextStyle(color: Colors.teal, fontSize: 25)),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
