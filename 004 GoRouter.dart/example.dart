import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
void main() => runApp(GoRouterApp());
final _router = GoRouter(
initialLocation: "/",
  routes: [
    GoRoute(
    name: "home",
      path: "/",
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
    name:"second",
      path: "/second",
      builder: (context, state) => SecondPage(),
    ),
    GoRoute(
    name: "third",
      path: "/third",
      builder: (context, state) => ThirdPage(),
    ),
  ],
);

class GoRouterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
    debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar:AppBar(title:const Center(child:Text("GoRouter-Home"))),
      body: Center(child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home Page",
        style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Home"),
            onPressed:(){context.go("/");},
          ),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Second"),
            onPressed:(){context.go("/second");},
          ),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Third"),
            onPressed:(){context.go("/third");},
          ),
        ],
      )),
    );
  }
}
class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar:AppBar(title:const Center(child:Text("GoRouter-Second"))),
      body: Center(child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Second Page",
        style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Home"),
            onPressed:(){context.go("/");},
          ),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Second"),
            onPressed:(){context.go("/second");},
          ),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Third"),
            onPressed:(){context.go("/third");},
          ),
        ],
      )),
    );
  }
}
class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar:AppBar(title:const Center(child:Text("GoRouter-Third"))),
      body: Center(child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Third Page",
        style: Theme.of(context).textTheme.titleLarge,
              ),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Home"),
            onPressed:(){context.go("/");},
          ),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Second"),
            onPressed:(){context.go("/second");},
          ),
          const SizedBox(height: 10),
          ElevatedButton(
          child: const Text("Third"),
            onPressed:(){context.go("/third");},
          ),
        ],
      )),
    );
  }
}




