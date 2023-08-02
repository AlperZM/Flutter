import 'package:flutter/material.dart';

void main()=> runApp(const RotationTransitionApp());

class RotationTransitionApp extends StatelessWidget{
  const RotationTransitionApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar:AppBar(title:const Center(child:Text("RotationTransitionApp"))),
        body: const Center(child: RotationTransitionDemo()),
      ),
    );
  }
}

class RotationTransitionDemo extends StatefulWidget{
  const RotationTransitionDemo({super.key});
  @override
  State<RotationTransitionDemo> createState()=> _RotationTransitionDemoState();
}
class _RotationTransitionDemoState extends State<RotationTransitionDemo> with
  TickerProviderStateMixin{
  late final AnimationController controller = AnimationController(
  duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
  parent: controller,
    curve: Curves.elasticInOut,
  );
  
  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context){
    return RotationTransition(
      turns: animation,
      child:const FlutterLogo(size: 100),
    );
  } 
}
