import 'package:flutter/material.dart';

const owlUrl =
'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';

void main() => runApp(const ImplicitAnimation1());

class ImplicitAnimation1 extends StatelessWidget{
  const ImplicitAnimation1({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar:AppBar(title:const Center(child:Text("FadeIn"))),
        body: const FadeInDemo(),
      ),
    );
  }
}

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0;
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Image.network(owlUrl, height: height * 0.6),
      TextButton(
        child: const Text(
          'Show Details',
          style: TextStyle(color: Colors.blueAccent),
        ),
        onPressed: () => {setState(()=> opacity = 1,)},
      ),
      AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(seconds: 2),
        child: const Column(
        children: [
          Text('Type: Owl'),
          Text('Age: 39'),
          Text('Employment: None'),
        ],
      ))
    ]));
  }
}




