import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color? _color = Colors.white;
  String? _colorBg = "White";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _color,
        appBar: AppBar(
          title: const Center(child: Text("Change Color")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Background Color is: $_colorBg",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<Color>(
                  value: _color,
                  icon: const Icon(Icons.brush),
                  elevation: 10,
                  dropdownColor: Colors.amberAccent,
                  underline: Container(height: 3, color: Colors.red),
                  onChanged: (Color? value) {
                    setState(() {
                      _color = value;
                      _colorBg = _color.toString();
                    });
                  },
                  items: const <DropdownMenuItem<Color>>[
                    DropdownMenuItem<Color>(
                      value: Colors.amber,
                      child: Text("Amber"),
                    ),
                    DropdownMenuItem<Color>(
                      value: Colors.teal,
                      child: Text("Teal"),
                    ),
                    DropdownMenuItem<Color>(
                      value: Colors.purple,
                      child: Text("Purple"),
                    ),
                    DropdownMenuItem<Color>(
                      value: Colors.blue,
                      child: Text("Blue"),
                    ),
                    DropdownMenuItem<Color>(
                      value: Colors.green,
                      child: Text("Green"),
                    ),
                    DropdownMenuItem<Color>(
                      value: Colors.white,
                      child: Text("White"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
