import 'package:flutter/material.dart';

void main() => runApp(const LayoutBuilderApp());

class LayoutBuilderApp extends StatelessWidget {
  const LayoutBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("LayoutBuilderApp"))),
        body: const Center(
          child: LayoutBuilderExample(),
        ),
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        return _buildWideContainer();
      } else {
        return _buildNormalContainer();
      }
    });
  }

  Widget _buildWideContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(width: 2, color: Colors.blue)),
            child: const Text("Wide Layout Builder")),
        const SizedBox(width: 20),
        Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(width: 2, color: Colors.pink)),
            child: const Text("Wide Layout Builder 2")),
      ],
    );
  }

  Widget _buildNormalContainer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(width: 2, color: Colors.blue)),
              child: const Text("Wide Layout Builder")),
          const SizedBox(height: 20),
          Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(width: 2, color: Colors.pink)),
              child: const Text("Wide Layout Builder 2")),
        ],
      ),
    );
  }
}
