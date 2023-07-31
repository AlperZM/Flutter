import 'package:flutter/material.dart';

void main() => runApp(OpacityApp());

class OpacityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("OpacityApp"))),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  double opacityValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 50, height: 50, color: Colors.red),
            const SizedBox(width: 20),
            Opacity(
              opacity: 0.5,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
                child: const Text("Opacity"),
              ),
            ),
            const SizedBox(width: 20),
            Container(width: 50, height: 50, color: Colors.red),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: opacityValue,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
                child: Center(child: Text(opacityValue.toStringAsFixed(1)),),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
            child: const Icon(Icons.add),
              onPressed:(){
                setState(()=> opacityValue += 0.1,);
              }
            ),
            const SizedBox(width: 20),
            ElevatedButton(
            child: const Icon(Icons.remove),
              onPressed:(){
                setState(()=> opacityValue -= 0.1,);
              }
            ),
          ],
        ),
      ],
    );
  }
}
