import 'package:flutter/material.dart';

void main() => runApp(const AnimatedBuilderApp());

class AnimatedBuilderApp extends StatelessWidget{
  const AnimatedBuilderApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: AnimatedBuilderDemo(),
    );
  }
}

class AnimatedBuilderDemo extends StatefulWidget{
  const AnimatedBuilderDemo({super.key});
  @override
  State<AnimatedBuilderDemo> createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
  duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();
  
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
    animation: _controller,
      child: Container( width: 100, height: 100, color: Colors.teal,
      child: const Center(child: FlutterLogo(size: 60)),
      ),
        builder: (BuildContext context, Widget? child){
         return Transform.rotate(
         angle: _controller.value * 2 * 3.14,
           child: child,
         ); 
        }
    );
  }
}

