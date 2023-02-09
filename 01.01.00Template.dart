// a basic template for flutter learning projects

import 'package:flutter/material.dart';
void main() => runApp(const TemplateApp());
class TemplateApp extends StatefulWidget {
  const TemplateApp({super.key});
  @override State<TemplateApp> createState() => _TemplateAppState();}
class _TemplateAppState extends State<TemplateApp> {
  bool isDark = false;  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(appBar: AppBar(
          title: const Center(child: Text("Basic Template App")),
          actions: <Widget>[
            Center( child: Text( isDark ? "LIGHT" : "DARK", style: TextStyle( fontSize: 20, 
             color: isDark ? Colors.amberAccent : Colors.black),),),
            const SizedBox(width: 15),
            Switch(value: isDark,activeColor: Colors.amber, onChanged: (bool value) {
                  setState(() {isDark = !isDark;});}),],),
        body:const Center(child: TemplateClass()),),);}}
class TemplateClass extends StatefulWidget{
  const TemplateClass({super.key});
  @override  State<TemplateClass> createState() => _TemplateClassState();}
class _TemplateClassState extends State<TemplateClass>{
    @override  Widget build(BuildContext context){
    return Center();}}
