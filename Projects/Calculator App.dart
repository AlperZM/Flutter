import 'package:flutter/material.dart';

void main() => runApp(const CalcApp());

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
final _nums = 0;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Calculator App"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.dark_mode),
                tooltip: "Dark Mode",
                onPressed: () {},
              ),
            ],
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.teal[100],
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.teal,
                  blurRadius: 4,
                  offset: Offset(4, 8),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 60,
                    width: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(5, 5),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Text(_nums.toString(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 2,
                      crossAxisCount: 4,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('1'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('2'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('3'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('4'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('5'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('6'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('7'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('8'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('9'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('0'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('+'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('-'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('*'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('/'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('='),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 24, color: Colors.red),
                              ),
                              onPressed: () {},
                              child: const Text('Clear',style: TextStyle(color: Colors.red)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
