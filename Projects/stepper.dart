import 'package:flutter/material.dart';

void main() => runApp(const StepperApp());

class StepperApp extends StatefulWidget {
  const StepperApp({super.key});
  @override
  State<StepperApp> createState() => _StepperAppState();
}

class _StepperAppState extends State<StepperApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Basic Stepper App")),
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
        body: const Center(
          child: StepApp(),
        ),
      ),
    );
  }
}

class StepApp extends StatefulWidget {
  const StepApp({super.key});
  @override
  State<StepApp> createState() => _StepAppState();
}

class _StepAppState extends State<StepApp> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index >= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text("Step 1 title"),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text("Content for Step 1"),
          ),
        ),
        const Step(
          title: Text('Step 2 title'),
          content: Text('Content for Step 2'),
        ),
        const Step(
          title: Text('Step 3 title'),
          content: Text('Content for Step 3'),
        ),
        const Step(
          title: Text('Step 4 title'),
          content: Text('Content for Step 4'),
        ),
      ],
    );
  }
}
