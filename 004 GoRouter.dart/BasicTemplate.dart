import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// set the router
final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
    path:"/second",
      builder:(context, state)=> const SecondPage(),
    ),
  ],
);

void main() => runApp(const AdaptiveApp());

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("AdaptiveApp"))),
      body: Center(child:ElevatedButton(
      child: const Text("Second Page"),
        onPressed: (){context.go("/second");}
      )),
    );
  }
}
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("SecondPage"))),
      body: Center(child:ElevatedButton(
      child: const Text("Home Page"),
        onPressed: (){context.go("/");}
      )),
    );
  }
}
