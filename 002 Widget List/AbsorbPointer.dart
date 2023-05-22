import 'package:flutter/material.dart';

void main() => runApp(const AbsorbPointerApp());

class AbsorbPointerApp extends StatelessWidget {
  const AbsorbPointerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("AbsorbPointer"))),
        body: const Center(child: AbsorbPointerDemo()),
      ),
    );
  }
}

class AbsorbPointerDemo extends StatelessWidget {
  const AbsorbPointerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          width: 200,
          height: 100,
          child: ElevatedButton(
            onPressed: () {
              print("Pressed");
            },
            child: null,
          ),
        ),
        SizedBox(
          width: 100,
          height: 200,
          
          
// ABSORBS ALL CLICK EVENTS          
          child: AbsorbPointer(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[200],
              ),
              onPressed: () {
                print("AbsorbPointer");
              },
              child: null,
            ),
          ),
        ),
      ],
    );
  }
}
