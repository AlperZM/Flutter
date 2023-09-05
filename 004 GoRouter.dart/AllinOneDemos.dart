import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// set the router
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/align",
      builder: (context, state) => const AlignPage(),
      // child route => ../align/..
      routes: [
        GoRoute(
          path: "fractionalAlign",

          ///align/fractionaleAlign
          builder: (context, state) => const FractionalAlignPage(),
        ),
        GoRoute(
          path: "alignment", //../align/alignment
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                key: state.pageKey,
                child: const AlignmentAlignPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                });
          },
        ),
      ],
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
      body: const Center(child: Text("use drawer to navigate")),
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
                  Text("Menu",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Text("Use List Tiles Belov"),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.align_horizontal_center),
              title: const Text("Go Align Widgets"),
              onTap: () => context.go("/align"),
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
            tooltip: "HomePage",
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go("/"),
          ),
          title: const Center(child: Text("AlingPage"))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              child: const Text("FractionalAlign Demo Page"),
              onPressed: () {
                context.go("/align/fractionalAlign");
              }),
          const SizedBox(height: 10),
          ElevatedButton(
              child: const Text("AlignmentAlign Demo Page"),
              onPressed: () {
                context.go("/align/alignment");
              }),
          const SizedBox(height: 10),
          const Text("Alignment: TOP-LEFT"),
          Container(
            width: 200,
            height: 200,
            color: Colors.amber,
            child: const Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlutterLogo(size: 70),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class FractionalAlignPage extends StatelessWidget {
  const FractionalAlignPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            tooltip: "AlignPage",
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go("/align"),
          ),
          title: const Center(child: Text("FractionalAlign"))),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("FractionalAlignment origin: TOP-LEFT",
              style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Container(
            width: 200,
            height: 200,
            color: Colors.amber,
            child: const Column(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset(0.6, 0.1),
                  child: FlutterLogo(size: 70),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class AlignmentAlignPage extends StatelessWidget {
  const AlignmentAlignPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            tooltip: "AlignPage",
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go("/align"),
          ),
          title: const Center(child: Text("AlignmentAlign"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Alignment origin: TOP-LEFT and childs origin:TOP-LEFT",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: const Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment(0.6, 0.1),
                    child: FlutterLogo(size: 70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
