import 'package:flutter/material.dart';

void main() => runApp(const AlignApp());

class AlignApp extends StatelessWidget{
  const AlignApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(title: const Center(child: Text("Align App"))),
      body: const Center(child: AlignDemos()),
      ),
    );
  }
}

class AlignDemos extends StatelessWidget{
  const AlignDemos({super.key});
  @override
  Widget build(BuildContext context){
    return GridView.count(
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      width: 120, height: 120,
      decoration: BoxDecoration(
      border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child:const Align(
          alignment: Alignment.center,
            child: FlutterLogo(size: 50),
          )),
          const Text("Center"),
        ],
      ),
    ),
    Container(
      width: 120, height: 120,
      decoration: BoxDecoration(
      border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child:const Align(
          alignment: Alignment.center,
            child: FlutterLogo(size: 50),
          )),
          const Text("Center"),
        ],
      ),
    ),
     Container(
      width: 120, height: 120,
      decoration: BoxDecoration(
      border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child:const Align(
          alignment: Alignment.center,
            child: FlutterLogo(size: 50),
          )),
          const Text("Center"),
        ],
      ),
    ),
     Container(
      width: 120, height: 120,
      decoration: BoxDecoration(
      border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(

        children: <Widget>[
          Container(
            child:const Align(
          alignment: Alignment.center,
            child: FlutterLogo(size: 50),
          )),
          const Text("Center"),
        ],
      ),
    ),
     Container(
      width: 120, height: 120,
      decoration: BoxDecoration(
      border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child:const Align(
          alignment: Alignment.center,
            child: FlutterLogo(size: 50),
          )),
          const Text("Center"),
        ],
      ),
    ),
  ],
);
  }
}
