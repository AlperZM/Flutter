import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Orianted Widget"))),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(15, (index) {
            return Center(
              child: Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text("$index",
                      style: Theme.of(context).textTheme.displayMedium),
                ),
              ),
            );
          }));
    });
  }
}
