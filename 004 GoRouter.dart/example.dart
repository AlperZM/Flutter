import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const GoRouterApp());
final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      name: "home",
      path: "/",
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      name: "second",
      path: "/second",
      builder: (context, state) {
        return const SecondPage();
      },
    ),
    GoRoute(
      name: "third",
      path: "/third",
      builder: (context, state) {
        return const ThirdPage();
      },
    ),
  ],
);

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({super.key});
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
      appBar: AppBar(title: const Center(child: Text("GoRouter-Home"))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Home Page",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Home"),
            onPressed: () {
              context.push("/");
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Second"),
            onPressed: () {
              context.push("/second");
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Third"),
            onPressed: () {
              context.push("/third");
            },
          ),
        ],
      )),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("GoRouter-Second"))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Second Page",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Home"),
            onPressed: () {
              context.push("/");
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Second"),
            onPressed: () {
              context.push("/second");
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Third"),
            onPressed: () {
              context.push("/third");
            },
          ),
        ],
      )),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("GoRouter-Third"))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Third Page",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Home"),
            onPressed: () {
              context.push("/");
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Second"),
            onPressed: () {
              context.push("/second");
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text("Third"),
            onPressed: () {
              context.push("/third");
            },
          ),
        ],
      )),
    );
  }
}
