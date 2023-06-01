import 'package:flutter/material.dart';

void main() => runApp(const CheckboxApp());

class CheckboxApp extends StatefulWidget {
  const CheckboxApp({super.key});
  @override
  State<CheckboxApp> createState() => _CheckboxAppState();
}

class _CheckboxAppState extends State<CheckboxApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("CheckboxApp"))),
        body: const Center(
          child: CheckboxDemo(),
        ),
      ),
    );
  }
}

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});
  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isCh3 = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveState = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveState.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(
                  () => isChecked = value!,
                );
              },
            ),
            const Text("Learn Dart"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: isChecked2,
              activeColor: Colors.green,
              checkColor: Colors.blue,
              hoverColor: Colors.orange,
              focusColor: Colors.pink,
              onChanged: (bool? value) {
                setState(() {
                  isChecked2 = value!;
                });
              },
            ),
            const Text("Learn Flutter"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  isCh3 = !isCh3;
                });
              },
              child: Container(
                width: 150,
                height: 30,
                color: Colors.teal[100],
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: isCh3,
                      onChanged: (bool? value) {
                        setState() {
                          isCh3 = value!;
                        }
                      },
                      activeColor: Colors.amber,
                    ),
                    const Text("Checkbox3"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
