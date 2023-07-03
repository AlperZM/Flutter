import 'package:flutter/material.dart';

void main() => runApp(const InteractiveViewerApp());

class InteractiveViewerApp extends StatelessWidget {
  const InteractiveViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('InteractiveViewer Sample'))),
        body: const InteractiveViewerExample(),
      ),
    );
  }
}

class InteractiveViewerExample extends StatelessWidget {
  const InteractiveViewerExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.green,
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(50),
          minScale: 0.1,
          maxScale: 2.0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.orange, Colors.red],
                stops: <double>[0, 1],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
