import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: TabBar(
            indicator: BoxDecoration(
            border: Border.all(width:1),
            borderRadius: BorderRadius.circular(5),
            ),
            indicatorPadding: const EdgeInsets.all(8),
            indicatorSize: TabBarIndicatorSize.tab,
           
            dividerColor: Colors.black,
            tabs:const <Widget>[
              Tab(text: "Blue"),
              Tab(text: "Green"),
              Tab(text: "Red"),
            ],
          ),
        ),
        body: TabBarView(          
          children: <Widget>[
            Container(color: Colors.blue),
            Container(color: Colors.green),
            Container(color: Colors.red),
          ],
        ),
      ),
    );
  }
}
