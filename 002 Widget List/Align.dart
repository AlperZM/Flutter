import 'package:flutter/material.dart';

void main() => runApp(const AlignApp());

class AlignApp extends StatelessWidget {
  const AlignApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Align App"))),
        body: const Center(child: AlignDemos()),
      ),
    );
  }
}

class AlignDemos extends StatelessWidget {
  const AlignDemos({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 160,
                alignment: Alignment.center,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text("alignment: Alignment.center",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 150,
                alignment: Alignment.bottomCenter,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Text("alignment: Alignment.bottomCenter",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 150,
                alignment: Alignment.bottomLeft,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Text("alignment: Alignment.bottomLeft",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 150,
                alignment: Alignment.bottomRight,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Text("alignment: Alignment..bottomRight",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 150,
                alignment: Alignment.centerLeft,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Text("alignment: Alignment.centerLeft",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 150,
                alignment: Alignment.centerRight,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Text("alignment: Alignment.centerRight",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 150,
                alignment: Alignment.topCenter,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Text("alignment: Alignment.topCenter",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 160,
                alignment: Alignment.topLeft,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text("alignment: Alignment.topLeft",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 200,
                height: 160,
                alignment: Alignment.topRight,
                child: const FlutterLogo(size: 50),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text("alignment: AlignmenttopRight",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
