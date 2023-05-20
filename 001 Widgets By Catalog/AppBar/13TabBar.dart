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
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Primary and Secondary TabBar")),
          bottom: const TabBar(
            dividerColor: Colors.red,
            tabs: <Widget>[
              Tab(
                text: "Flighs",
                icon: Icon(Icons.flight),
              ),
              Tab(
                text: 'Trips',
                icon: Icon(Icons.luggage),
              ),
              Tab(
                text: 'Explore',
                icon: Icon(Icons.explore),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar("Flights"),
            NestedTabBar("Trips"),
            NestedTabBar("Explore"),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});
  final String outerTab;
  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(child: Text("Overview", style: TextStyle(color: Colors.black))),
            Tab(
                child: Text("Specifications",
                    style: TextStyle(color: Colors.black))),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.limeAccent,
                        spreadRadius: 5,
                        blurRadius: 4,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text('${widget.outerTab}: Overview tab',
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 30))),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.teal,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text('${widget.outerTab}: Specifications tab',
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 30))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
