import 'package:flutter/material.dart';
void main() => runApp(const ThemeApp());
class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key}); @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.amber,secondary: Colors.teal,),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.red, fontSize: 22)),
        iconTheme: const IconThemeData(size: 40,color: Colors.red,),),
      home: Scaffold(appBar: AppBar(title: const Text("Theme")),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 150,height: 40,
                child: ElevatedButton(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[const Icon(Icons.warning_amber),
                      Text("buton",style: Theme.of(context).textTheme.bodyMedium),
                    ],),
                  onPressed: () {},),),
              const SizedBox(height: 20),
              const Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.favorite),
                  SizedBox(width: 20),Icon(Icons.abc),],),
              const SizedBox(height: 20),
              Container(color: Theme.of(context).colorScheme.secondary,
                child: Text('Text with a background color',
                  style: Theme.of(context).textTheme.titleLarge,),),
              const SizedBox(height: 20),
              const Text("demo theme"),],),),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, size: 30),
          onPressed: () {},
        ),),);}}
