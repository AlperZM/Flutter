import 'package:flutter/material.dart';

void main() => runApp(const ScrollBarApp());

class ScrollBarApp extends StatelessWidget {
  const ScrollBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("ScrollBarApp"))),
        body: const Center(
          child: AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final ScrollController _firstController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 302,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _firstController,
                    child: ListView.builder(
                        controller: _firstController,
                        itemCount: 16,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            child: Text("Scrollable 1: Index $index"),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                        primary: true,
                        itemCount: 16,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            color: index.isEven
                                ? Colors.amberAccent
                                : Colors.blueAccent,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Text('Scrollable 2 : Index $index')),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
    });
  }
}
