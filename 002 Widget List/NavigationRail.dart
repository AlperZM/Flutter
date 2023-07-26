import 'package:flutter/material.dart';

void main()=> runApp(const NavigationRailApp());

class NavigationRailApp extends StatelessWidget{
  const NavigationRailApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        centerTitle: true,
          title: const Text("NavigationRailApp"),
        ),
        body:const NavigationRailDemo(),
      ),
    );
  }
}

class NavigationRailDemo extends StatefulWidget{
  const NavigationRailDemo({super.key});
  @override
  State<NavigationRailDemo> createState() => _NavigationRailDemoState();
}
class _NavigationRailDemoState extends State<NavigationRailDemo>{
  @override
  Widget build(BuildContext context){
    return Row(
    children: [
      NavigationRail(
      selectedIndex: 0,
        destinations:const < NavigationRailDestination>[
           NavigationRailDestination(
          icon: Icon(Icons.favorite_outlined),
          selectedIcon: Icon(Icons.favorite_rounded),
            label: Text("Favorite"),
          ),
           NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
        ],
      ),
      const Center(child: Text("AppBody")),
    ],
    );
  }
}
