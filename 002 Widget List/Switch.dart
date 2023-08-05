import 'package:flutter/material.dart';

void main() => runApp(const SwitchApp());

class SwitchApp extends StatelessWidget {
  const SwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Switch Sample')),
        body: const Center(
          child: SwitchExample(),
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool switch1 = true;
  bool switch2 = true;
  bool switch3 = true;
  bool switch4 = true;
//---->switch2

  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.amber;
      }
      return null;
    },
  );
  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.amber.withOpacity(0.54);
    }
    if (states.contains(MaterialState.disabled)) {
      return Colors.grey.shade400;
    }
    return null;
  });

//----> Switch 4
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Default Switch:"),
            const SizedBox(width: 20),
            Switch(
                value: switch1,
                onChanged: (bool value) {
                  setState(
                    () => switch1 = value,
                  );
                }),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Customized Switch:"),
            const SizedBox(width: 20),
            Switch(
                value: switch2,
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value) {
                  setState(
                    () => switch2 = value,
                  );
                }),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Detailed Switch:"),
            const SizedBox(width: 20),
            Switch(
                value: switch3,
                activeColor: Colors.teal,
                activeTrackColor: Colors.amber,
                hoverColor: Colors.red[400],
                inactiveThumbColor: Colors.black45,
                inactiveTrackColor: Colors.brown[400],
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onChanged: (bool value) {
                  setState(
                    () => switch3 = value,
                  );
                }),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("use with: useMaterial3: true"),
            const SizedBox(width: 20),
            Switch(
                value: switch4,
                thumbIcon: thumbIcon,
                onChanged: (bool value) {
                  setState(
                    () => switch4 = value,
                  );
                }),
          ],
        ),
      ],
    );
  }
}
