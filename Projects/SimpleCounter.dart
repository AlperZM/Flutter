import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});
  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0;
  final List<Color> _colors = [Colors.black, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Counter")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // +1 Button
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.green,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: IconButton(
                    icon: const Icon(Icons.plus_one, size: 30),
                    onPressed: () {
                      setState(() {
                        _count++;
                      });
                    }),
              ),
              // Display Area
              Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(_count.toString(),
                        style: TextStyle(
                            fontSize: 25,
                            color: _count < 0
                                ? _colors[2]
                                : _count > 10
                                    ? _colors[1]
                                    : _colors[0])),
                  )),
              // -1 Button
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red, width: 1.0, style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: IconButton(
                    icon: const Icon(Icons.exposure_neg_1_outlined, size: 30),
                    onPressed: () {
                      setState(() {
                        _count--;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
