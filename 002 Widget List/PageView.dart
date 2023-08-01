import 'package:flutter/material.dart';

void main() => runApp(const PageViewExampleApp());

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("PageViewExampleApp"))),
        body: PageViewExample(),
      ),
    );
  }
}

class PageViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      allowImplicitScrolling: true,
      clipBehavior: Clip.antiAlias,
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
      ],
    );
  }
}
