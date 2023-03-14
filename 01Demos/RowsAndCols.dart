import 'package:flutter/material.dart';

void main() => runApp(const RowsAndCols());

class RowsAndCols extends StatelessWidget{
  const RowsAndCols({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title:const Center(child: Text("RowsAndCols"))),
        body: Center(
        child: AppBody(),
        ),
      ),
    );
  }
}
class AppBody extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
      children: [BlueBox(),BlueBox(),BlueBox(),],
      ),
      Row(
      children: [RedBox(),RedBox(),RedBox(),],
      ),
    ],
    );
  }
}
class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
      child: const Center(child: Text("Col"),),
    );
  }
}
class RedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(), 
      ),
      child:const Center(child: Text("Row"),),
    );
  }
}
