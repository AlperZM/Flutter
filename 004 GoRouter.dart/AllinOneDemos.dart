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
    path:"/align",
      builder:(context, state)=> const AlignPage(),
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
      body:const Center(child: Text("use drawer to navigate")),
      drawer: Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
        children: <Widget>[
         const DrawerHeader(
          decoration: BoxDecoration(color: Colors.teal),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Chip(
              label: Icon(Icons.menu),
              ),
              Text("Menu",style:TextStyle(fontSize: 20, color: Colors.white)),
              Text("Use List Tiles Belov"),
              
            ],
            ),
          ),
          ListTile(
          leading: const Icon(Icons.align_horizontal_center),
            title: const Text("Go Align Widgets"),
            onTap:()=> context.go("/align"),
          ),
        ],
      ),
      ),
    );
  }
}
class AlignPage extends StatelessWidget {
  const AlignPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
             leading: IconButton(
      icon:const Icon(Icons.arrow_back),
        onPressed:()=> context.go("/"),
      ),
        title: const Center(child: Text("SecondPage"))),
      body: Center(child:ElevatedButton(
      child: const Text("Align Demos Page"),
        onPressed: (){context.go("/");}
      )),
    );
  }
}
