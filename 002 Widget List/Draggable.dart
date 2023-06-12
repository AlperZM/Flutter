import 'package:flutter/material.dart';

//      debugShowCheckedModeBanner: false,
void main() => runApp(const DraggableApp());

class DraggableApp extends StatelessWidget {
  const DraggableApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("DraggableApp"))),
        body: const Center(child: DraggableDemo()),
      ),
    );
  }
}

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({super.key});
  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  int acceptedData = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<int>(
          data: 10,
          feedback: Container(
            width: 100,
            height: 100,
            color: Colors.orange,
            child: const Column(
              children: <Widget>[
                Icon(Icons.directions_run),
                Text("Active Dragging Container",
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          childWhenDragging: Container(
            width: 100,
            height: 100,
            color: Colors.pinkAccent,
            child: const Center(child: Text("Child when dragging")),
          ),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.lightGreenAccent,
            child: const Center(child: Text("Waiting for drag event")),
          ),
        ),
        DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              width: 100,
              height: 100,
              color: Colors.cyan,
              child: Center(
                child: Text('Value is updated to: $acceptedData'),
              ),
            );
          },
          onAccept: (int data) {
            setState(() {
              acceptedData += data;
            });
          },
        ),
      ],
    );
  }
}
