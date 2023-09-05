import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// set the router
final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
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
    );
  }
}
