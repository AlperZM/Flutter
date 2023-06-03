import 'package:flutter/material.dart';

void main() => runApp(const CircProgIndApp());

class CircProgIndApp extends StatelessWidget {
  const CircProgIndApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.teal,
          secondary: Colors.amber,
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.red, fontSize: 22)),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Progress Indicators"))),
        body: const Center(
          child: Indicators(),
        ),
      ),
    );
  }
}

class Indicators extends StatefulWidget {
  const Indicators({super.key});
  @override
  State<Indicators> createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerCirc2;
  bool determinate = false;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(
        () {
          setState(() {});
        },
      );
    controllerCirc2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(
        () {
          setState(() {});
        },
      );
    controllerCirc2.repeat(reverse: true);
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controllerCirc2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Circular progress indicator with a fixed color",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          CircularProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            strokeWidth: 5,
            value: controller.value,
            semanticsLabel: "Circular progress indicator",
          ),
          const SizedBox(height: 20),
          Text("Circular Proggres Indicator with pause option",
              style: Theme.of(context).textTheme.bodyMedium),
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.grey,
            strokeWidth: 6,
            value: controllerCirc2.value,
            semanticsLabel: "Circular Progress with Switch",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Control Circular Progres",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Switch(
                  value: determinate,
                  onChanged: (bool value) {
                    setState(() {
                      determinate = value;
                      if (determinate) {
                        controllerCirc2.stop();
                      } else {
                        controllerCirc2
                          ..forward(from: controllerCirc2.value)
                          ..repeat();
                      }
                    });
                  }),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Linear progress indicator with a fixed color",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          LinearProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            color: Colors.red,
            minHeight: 3,
            value: controller.value,
            semanticsLabel: "Linear progress indicator",
          ),
          const SizedBox(height: 20),
          Text("Linear Proggres Indicator with pause option",
              style: Theme.of(context).textTheme.bodyMedium),
          LinearProgressIndicator(
            color: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.black,
            minHeight: 6,
            value: controllerCirc2.value,
            semanticsLabel: "Linear Progress with Switch",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Linear Circular Progres",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Switch(
                  value: determinate,
                  onChanged: (bool value) {
                    setState(() {
                      determinate = value;
                      if (determinate) {
                        controllerCirc2.stop();
                      } else {
                        controllerCirc2
                          ..forward(from: controllerCirc2.value)
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
