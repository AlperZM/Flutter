import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main()=> runApp(const GoRouterClasses());

final _router = GoRouter(
initialLocation: "/",
  routes: [
    GoRoute(
    path: "/",
      builder: (context, state)=> MainPage(),
    ),
    GoRoute(
    path: "/animationpage",
    pageBuilder:(context, state){
      return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 400),
        reverseTransitionDuration: const Duration(milliseconds: 400), 
        barrierColor: Colors.red,
      key: state.pageKey,child: AnimationPage(),
        transitionsBuilder:(context,animation,secondaryAnimation,child){
          return FadeTransition(
          opacity: CurveTween(curve:Curves.easeInOutCubic).animate(animation),
            child:child,
          );
        }
      );
    }
    ),
  ],
);


class GoRouterClasses extends StatelessWidget{
  const GoRouterClasses({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
    debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar:AppBar(title:const Center(child:Text("MainPage"))),
      body: Center(
      child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
        children: [
          ElevatedButton(
          child: const Text("AnimatedPage"),
            onPressed:(){context.go("/animationpage");},
          ),
        ],
      ),
      ),
    );
  }
}

class AnimationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar:AppBar(
      leading:IconButton(
      tooltip: "Back",
        icon:const Icon(Icons.arrow_back),
        onPressed: (){context.go("/");},
      ),
      title:const Center(child:Text("AnimationPage"))),
      body: Center(
      child: Container(),
      ),
    );
  }
}


