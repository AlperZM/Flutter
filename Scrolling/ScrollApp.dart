import 'package:flutter/material.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar:AppBar(title:const Text("Simple Scroll App")),
        body:const Row(
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SideMenu(),
            SizedBox(width: 10.0),
            Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Use navigation menu for see examples"),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleChildScrollViewApp extends StatelessWidget {
  const SingleChildScrollViewApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("SingleChildScrollView")),
      body: Row(
        mainAxisAlignment:MainAxisAlignment.start,
      children:<Widget>[
       const SideMenu(),
       const SizedBox(width: 10.0),
              Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Simple Scrollable Widget",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Text("SingleChildScrollView",
                style: Theme.of(context).textTheme.titleMedium),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(border: Border.all()),
              child:const SingleChildScrollView(
                  child:Column(
                  children: <Widget>[
                    ListTile(title: Text("List Tile")),
                    SizedBox(height:20.0),
                    ListTile(title: Text("List Tile")),
                    SizedBox(height:20.0),
                    ListTile(title: Text("List Tile")),
                    SizedBox(height:20.0),
                    ListTile(title: Text("List Tile")),
                    SizedBox(height:20.0),
                    ListTile(title: Text("List Tile")),
                    SizedBox(height:20.0),
                  ]
                ),
              ),
              ),

          ],
    ),
      ],
      ),

    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      width: 80,
      height: double.infinity,
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          const Text("Menu",
              style: TextStyle(fontSize: 18, color: Colors.white)),
          const SizedBox(height: 10),
          TextButton(
            child: const Text("Simple"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SingleChildScrollViewApp();
                  }),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
