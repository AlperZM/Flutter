import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// add pubsec.yaml: privider: ....

void main() => {
      runApp(
        ChangeNotifierProvider(
          create: (context) => Counter(),
          child: MyApp(),
        ),
      ),
    };

class Counter with ChangeNotifier {
  int value = 0;
  void increment() {
    value++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo App",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter app")),
        body: MyBody(),
        floatingActionButton: FAB(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecPage()),
              );
            },
            child: const Text("SecondPage"),
          ),
          const SizedBox(height: 20),
          const Text('You have pushed the button this many times:'),
          Consumer<Counter>(
            builder: (context, counter, child) => Text(
              "${counter.value}",
              style: const TextStyle(fontSize: 26),
            ),
          ),
        ],
      ),
    );
  }
}

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        var counter = context.read<Counter>();
        counter.increment();
      },
      tooltip: "increment",
      child: const Icon(Icons.add),
    );
  }
}

class SecPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Second Page"),
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                "${counter.value}",
                style: const TextStyle(fontSize: 26, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FAB(),
    );
  }
}
