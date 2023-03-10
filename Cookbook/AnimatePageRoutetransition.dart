//simple animations in routing screens

import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: DemoAppBar(),
        body: DemoBody(),
      ),
    );
  }
}

class DemoAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text("DemoApp")),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.dark_mode),
          tooltip: "Dark Mode",
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.calendar_today),
          tooltip: "Calendar",
          onPressed: () {},
        ),
      ],
    );
  }
}

class DemoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: const Text("SecondPage"),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          }),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text("First Page"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
