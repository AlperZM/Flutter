// Simple counter for manage state
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter()),
        ],
        child: const MyApp(),
      ),
    );

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty("count", count));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Provider Example")),
        ),
        body: const AppBody(),
        floatingActionButton: const FAB(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('You have pushed the button this many times:'),
          Count(),
        ],
      ),
    );
  }
}

class FAB extends StatelessWidget {
  const FAB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: const Key("increment_floatingActionButton"),
      onPressed: () => context.read<Counter>().increment(),
      tooltip: "Increment",
      child: const Icon(Icons.add),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      "${context.watch<Counter>().count}",
      key: const Key("counterState"),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
