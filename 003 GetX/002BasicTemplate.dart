import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()=> runApp(const MyApp());
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:const Center(child:Text("Demo App")),
          actions: [
            const SizedBox(width:20),
            IconButton(
              tooltip: "Settings",
              icon: Icon(Icons.settings_outlined,),
              onPressed: (){},
            ),
            IconButton(
              tooltip:"Theme",
              icon: Icon(Icons.question_mark_outlined,),
              onPressed: (){print("set the theme");},
            ),
          ],
        ),
        body: const Center(child: DemoApp()),
      ),
    );
  }
}
class DemoApp extends StatelessWidget{
  const DemoApp({super.key});
  @override
  Widget build(BuildContext context){
    return Container(

    );
  }
}
