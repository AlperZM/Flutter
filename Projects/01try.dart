import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// add pubsec.yaml: privider: ....

void main() => {
      runApp(
        MultiProvider(
        providers: [
          Provider<Counter>(create: (counter)=> Counter()),
          Provider<ChangeTheme>(create: (changeTheme)=>ChangeTheme()),
        ],
          child:const CounterApp(),
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

class ChangeTheme with ChangeNotifier {
  bool isDark = false;
  void changeColor(bool isDark) {
    isDark = !isDark;
    notifyListeners();
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});
  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: MyAppBar(),
        body: const Center(child: CounterClass()),
        floatingActionButton: FAB(),
      ),
    );
  }
}

class CounterClass extends StatefulWidget {
  const CounterClass({super.key});
  @override
  State<CounterClass> createState() => _CounterClassState();
}

class _CounterClassState extends State<CounterClass> {
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
            child: const Text("Second Page"),
          ),
          const SizedBox(height: 20),
          const Text('You have pushed the button this many times:'),
          Consumer<Counter>(
            builder: (context, counter, child) => Text(
              "${counter.value}",
              style: const TextStyle(fontSize: 25, color: Colors.red),
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
      appBar: MyAppBar(),
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

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text("Basic Template App")),
      actions: <Widget>[
        Center(
          child: Consumer<ChangeTheme>(
            builder: (context, changeTheme ,isDark)=> Text(
            changeTheme.isDark ? 'LIGHT' : 'DARK', style: TextStyle(
                fontSize: 20,
                color: changeTheme.isDark ? Colors.amberAccent : Colors.black),
            ),
            
           
           
          ),
        ),
        const SizedBox(width: 15),
        Switch(
            value: false,
          activeColor: Colors.amber,
            onChanged: (bool value) {
              value ? true : false;
              Consumer<ChangeTheme>(
              builder: (context, changeTheme, changeColor) => 
                changeColor(),
                                   );
            }),
      ],
    );
  }
}
