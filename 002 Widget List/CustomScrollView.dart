import 'package:flutter/material.dart';

void main() => runApp(const CustomScrollViewApp());

class CustomScrollViewApp extends StatelessWidget {
  const CustomScrollViewApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("CustomScrollViewApp"))),
        body: const AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.blue[100],
                height: 100,
                child: const Text("child"),
              );
            },
            childCount: 15,
          ),
        ),
      ],
    );
  }
}
