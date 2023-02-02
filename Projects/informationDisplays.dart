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
        body: Center(
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.amber : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: CircularPIApp(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.amber : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: CIPwDetermined(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.amber : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: LinearPI(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.amber : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: LPIwD(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.amber : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.amber : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularPIApp extends StatefulWidget {
  const CircularPIApp({super.key});
  @override
  State<CircularPIApp> createState() => _CircularPIAppState();
}

class _CircularPIAppState extends State<CircularPIApp>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Circular progress indicator with a fixed color',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          CircularProgressIndicator(
            strokeWidth: 5,
            value: controller.value,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            semanticsLabel: "Circular progress indicator",
          ),
        ],
      ),
    );
  }
}

class CIPwDetermined extends StatefulWidget {
  const CIPwDetermined({super.key});
  @override
  State<CIPwDetermined> createState() => _CIPwDeterminedState();
}

class _CIPwDeterminedState extends State<CIPwDetermined>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'CircularProgressIndicator width Determined ("Switch()")',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          CircularProgressIndicator(
            strokeWidth: 5,
            value: controller.value,
            semanticsLabel: "CircularProgressIndıcator",
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Determinate Mode (play / pause)',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Switch(
                  value: determinate,
                  activeColor: Colors.greenAccent,
                  onChanged: (bool value) {
                    setState(() {
                      determinate = value;
                      if (determinate) {
                        controller.stop();
                      } else {
                        controller
                          ..forward(from: controller.value)
                          ..repeat();
                      }
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class LinearPI extends StatefulWidget {
  const LinearPI({super.key});
  @override
  State<LinearPI> createState() => _LinearPIState();
}

class _LinearPIState extends State<LinearPI> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text("Linear progress indicator"),
          LinearProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            value: controller.value,
            semanticsLabel: "Linear progress indicator",
          ),
        ],
      ),
    );
  }
}

class LPIwD extends StatefulWidget {
  const LPIwD({super.key});
  @override
  State<LPIwD> createState() => _LPIwDState();
}

class _LPIwDState extends State<LPIwD> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Linear progress indicator"),
          const SizedBox(height: 15),
          LinearProgressIndicator(
            value: controller.value,
            semanticsLabel: "Linear progress Indicator",
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Determinate Mode Swtich",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Switch(
                  value: determinate,
                  onChanged: (bool value) {
                    setState(() {
                      determinate = value;
                      if (determinate) {
                        controller.stop();
                      } else {
                        controller
                          ..forward(from: controller.value)
                          ..repeat();
                      }
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
