import 'package:flutter/material.dart';

void main() => runApp(const TemplateApp());

class TemplateApp extends StatefulWidget {
  const TemplateApp({super.key});
  @override
  State<TemplateApp> createState() => _TemplateAppState();
}

class _TemplateAppState extends State<TemplateApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark
          ? ThemeData(
              scaffoldBackgroundColor: const Color.fromRGBO(46, 79, 79, 1),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color.fromRGBO(44, 51, 51, 1),
                secondary: const Color.fromRGBO(14, 131, 136, 1),
              ),
              textTheme: const TextTheme(
                displayLarge: TextStyle(
                    color: Color.fromRGBO(203, 228, 222, 1), fontSize: 28),
                displayMedium: TextStyle(
                    color: Color.fromRGBO(203, 228, 222, 1), fontSize: 20),
                displaySmall: TextStyle(
                    color: Color.fromRGBO(203, 228, 222, 1), fontSize: 16),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(14, 131, 136, 1),
                  foregroundColor: const Color.fromRGBO(29, 38, 125, 1),
                ),
              ),
            )
          : ThemeData(
              scaffoldBackgroundColor: const Color.fromRGBO(247, 255, 229, 1),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color.fromRGBO(225, 236, 200, 1),
                secondary: const Color.fromRGBO(196, 215, 178, 1),
              ),
              textTheme: const TextTheme(
                displayLarge: TextStyle(
                    color: Color.fromRGBO(160, 196, 157, 1), fontSize: 28),
                displayMedium: TextStyle(
                    color: Color.fromRGBO(160, 196, 157, 1), fontSize: 20),
                displaySmall: TextStyle(
                    color: Color.fromRGBO(160, 196, 157, 1), fontSize: 16),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(150, 182, 197, 1),
                  foregroundColor: const Color.fromRGBO(160, 196, 157, 1),
                ),
              ),
            ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Basic Template App")),
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
    return GridView.count(
      padding: const EdgeInsets.all(8),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.secondary)),
            child: Text("1", style: Theme.of(context).textTheme.displayMedium)),
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Theme.of(context).colorScheme.secondary)),
            child: Text("2", style: Theme.of(context).textTheme.displayLarge)),
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.primary)),
            child: Text("3", style: Theme.of(context).textTheme.displaySmall)),
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.primary)),
            child: Container(
              width: 20,
              height: 20,
              color: Theme.of(context).colorScheme.secondary,
            )),
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.primary)),
            child: Text("5", style: Theme.of(context).textTheme.bodyLarge)),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.primary)),
          child: Center(
              child: ElevatedButton(
            child: const Text("ElevatedButton"),
            onPressed: () {},
          )),
        ),
      ],
    );
  }
}
