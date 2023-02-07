import 'package:flutter/material.dart';

void main() => runApp(const MediaQueryApp());

class MediaQueryApp extends StatefulWidget {
  const MediaQueryApp({super.key});
  @override
  State<MediaQueryApp> createState() => _MediaQueryAppState();
}

class _MediaQueryAppState extends State<MediaQueryApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("MediaQuery App")),
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
        body: const Center(child: TemplateClass()),
      ),
    );
  }
}

class TemplateClass extends StatefulWidget {
  const TemplateClass({super.key});
  @override
  State<TemplateClass> createState() => _TemplateClassState();
}

class _TemplateClassState extends State<TemplateClass> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Container>[
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("The size is: $size"),
              )),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("The size is: $size"),
              )),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("The size is: $size"),
              )),
        ],
      ),
    );
  }
}
