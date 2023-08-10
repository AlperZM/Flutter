import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const GoRouterApp());
final GoRouter _router = GoRouter(
  initialLocation: "/login",
  routes: <RouteBase>[
    GoRoute(
      name: "login",
      path: "/login",
      builder: (context, state) => Login(),
    ),
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

class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Login"))),
      body: Center(
          child: Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Card(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                    key: _formKey,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Id",
                      label: Text("ID Area"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    key: _formKey2,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: "Enter Your PASSWORD",
                      label: Text("Password"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () {
//                     if (_formKey.currentState!.validate()){}
                      context.go("/");
                    }),
              ],
            ),
          ),
        ),
      )),
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
