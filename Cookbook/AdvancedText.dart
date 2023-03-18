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
          title: const Center(child: Text("Advanced TexField App")),
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
  final textController = TextEditingController();
  void _printLatestValue() {
    print("First FormField inputs: ${textController.text}");
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "handling text",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
