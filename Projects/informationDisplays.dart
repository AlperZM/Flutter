// loading and other display widgets
import 'package:flutter/material.dart';

void main() => runApp(const DisplayApp());

class DisplayApp extends StatefulWidget {
  const DisplayApp({super.key});
  @override
  State<DisplayApp> createState() => _DisplayAppState();
}

class _DisplayAppState extends State<DisplayApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Display Information Widgets")),
          actions: <Widget>[
            Center(
              child: Text(isDark ? "Light" : "Dark",
                  style: TextStyle(
                      fontSize: 20,
                      color: isDark ? Colors.amber : Colors.black)),
            ),
            Switch(
              value: isDark,
              activeColor: Colors.amber,
              onChanged: (bool value) {
                setState(() {
                  isDark = value;
                });
              },
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
