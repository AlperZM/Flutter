import 'package:flutter/material.dart';

void main() => runApp(const ReordeableApp());

class ReordeableApp extends StatelessWidget{
  const ReordeableApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar:AppBar(title:const Center(child:Text("ReordeableApp"))),
        body: const ReordeableAppDemo(),
      ),
    );
  }
}

class ReordeableAppDemo extends StatefulWidget{
  const ReordeableAppDemo({super.key});
  @override
  State<ReordeableAppDemo> createState()=> _ReordeableAppDemoState();
}

class _ReordeableAppDemoState extends State<ReordeableAppDemo>{
  final List<int> _items = List<int>.generate(5,(int index)=>index);
  @override  
  Widget build(BuildContext context){
      final ColorScheme colorScheme = Theme.of(context).colorScheme;
  final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
  final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return ReorderableListView(
    padding:const EdgeInsets.symmetric(horizontal: 40),
      children: [
        for(int index = 0; index < _items.length; index += 1)
        ListTile(
        key: Key("$index"),
          tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
          title: Text("Item ${_items[index]}"),          
        ),
      ],
      onReorder: (int oldIndex, int newIndex){
        setState((){
          if(oldIndex < newIndex){
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      }
    );
  }
}


