import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber[100],
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "/secondPage": (context) => SecondPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 160,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Sliver AppBar -- Home"),
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text("secondPage",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/secondPage",
                    );
                  }),
            ],
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[50 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: false,
            stretch: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver AppBar -- Secondpage'),
            ),
          ),
          SliverGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
            crossAxisSpacing:10,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
              color: Colors.amber,
                border: Border.all(width:1),
              ),
            
              child: Center(child:ElevatedButton(
              child: const Text("Home"),
                onPressed:(){},
              ),),
            ),
             Container(
              decoration: BoxDecoration(
              color: Colors.amber,
                border: Border.all(width:1),
              ),
            
              child: Center(child:ElevatedButton(
              child: const Text("SecondPage"),
                onPressed:(){},
              ),),
            ),
            Container(
              decoration: BoxDecoration(
              color: Colors.amber,
                border: Border.all(width:1),
              ),
            
              child: Center(child:ElevatedButton(
              child: const Text("Home"),
                onPressed:(){},
              ),),
            ),
             Container(
              decoration: BoxDecoration(
              color: Colors.amber,
                border: Border.all(width:1),
              ),
            
              child: Center(child:ElevatedButton(
              child: const Text("SecondPage"),
                onPressed:(){},
              ),),
            ),
          ],
          ),
          SliverList(
    delegate: SliverChildListDelegate(
      [
        Container(color: Colors.red, height: 150.0),
        Container(color: Colors.purple, height: 150.0),
        Container(color: Colors.green, height: 150.0),
         Container(color: Colors.cyan, height: 150.0),
        Container(color: Colors.teal, height: 150.0),
        Container(color: Colors.amber, height: 150.0),
      ],
    ),
),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
