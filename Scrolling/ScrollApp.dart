import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Simple Scroll App")),
        body: const Row(
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
      appBar: AppBar(title: const Text("SingleChildScrollView")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
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
                child: const SingleChildScrollView(
                  child: Column(children: <Widget>[
                    ListTile(title: Text("List Tile")),
                    SizedBox(height: 20.0),
                    ListTile(title: Text("List Tile")),
                    SizedBox(height: 20.0),
                    ListTile(title: Text("List Tile")),
                    SizedBox(height: 20.0),
                    ListTile(title: Text("List Tile")),
                    SizedBox(height: 20.0),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CustomScrollView")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 100,
            decoration:
                BoxDecoration(color: Colors.tealAccent, border: Border.all()),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
                        title: Text("List: $index"),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20.0),
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(border: Border.all()),
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          margin: const EdgeInsets.all(10));
                    },
                    childCount: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dragable extends StatelessWidget {
  const Dragable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
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
          TextButton(
            child: const Text("Custom"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CustomScroll();
                }),
              );
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            child: const Text("Dragable"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const Dragable();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
