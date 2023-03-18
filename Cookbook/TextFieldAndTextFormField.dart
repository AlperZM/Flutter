import 'package:flutter/material.dart';

void main() => runApp(const TexFieldApp());

class TexFieldApp extends StatefulWidget {
  const TexFieldApp({super.key});
  @override
  State<TexFieldApp> createState() => _TexFieldAppState();
}

class _TexFieldAppState extends State<TexFieldApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Basic TexField App")),
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
        body: const Center(child: TexFieldClass()),
      ),
    );
  }
}

class TexFieldClass extends StatefulWidget {
  const TexFieldClass({super.key});
  @override
  State<TexFieldClass> createState() => _TexFieldClassState();
}

class _TexFieldClassState extends State<TexFieldClass> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "This is TextField Widget",
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "This is TextFormField Widget",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
