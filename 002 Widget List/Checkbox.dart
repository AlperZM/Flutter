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
      ],
    );
  }
}
