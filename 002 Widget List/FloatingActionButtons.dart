import 'package:flutter/material.dart';

void main() => runApp(const FloatingActionButtonExampleApp());

class FloatingActionButtonExampleApp extends StatelessWidget {
  const FloatingActionButtonExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FabExample(),
    );
  }
}

class FabExample extends StatelessWidget {
  const FabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('FloatingActionButton Sample')),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Green: Default FAB"),
          Text("Red: Default FAB.small()"),
          Text("Blue: Default FAB.large"),
          Text("Teal: Default FAB.extended()"),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            child: const Icon(Icons.navigation),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.small(
            onPressed: () {},
            backgroundColor: Colors.red,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton.large(
                onPressed: () {},
                backgroundColor: Colors.blueAccent,
                elevation: 16,
                child: const Text("Elevation"),
              ),
              const SizedBox(width: 20),
              FloatingActionButton.large(
                onPressed: () {},
                backgroundColor: Colors.blueAccent,
                elevation: 16,
                splashColor: Colors.red,
                child: const Text("Elevation"),
              ),
            ],
          ),
          FloatingActionButton.large(
            onPressed: () {},
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add_a_photo),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Extended'),
            icon: const Icon(Icons.thumb_up),
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
