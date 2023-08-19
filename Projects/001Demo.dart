import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.teal[200],
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => Login(),
          "/home": (context) => Home(),
        });
  }
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(8),
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Card(
                  child: Form(
                key: _loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(),
                    TextFormField(),
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text("Login"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )))),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("HomePage")),
      ),
      body: Container(),
    );
  }
}
