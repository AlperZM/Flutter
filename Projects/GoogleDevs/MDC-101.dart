import 'package:flutter/material.dart';

void main() => runApp(const LoginPageApp());

class LoginPageApp extends StatefulWidget {
  const LoginPageApp({super.key});
  @override
  State<LoginPageApp> createState() => _LoginPageAppState();
}

class _LoginPageAppState extends State<LoginPageApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("LoginPage")),
          actions: <Widget>[
            Center(
              child: Text(
                isDark ? "LIGHT" : "DARK",
                style: TextStyle(
                    fontSize: 20,
                    color: isDark ? Colors.amberAccent : Colors.black),
              ),
            ),
            const SizedBox(width: 15),
            Switch(
                value: isDark,
                activeColor: Colors.amber,
                onChanged: (bool value) {
                  setState(() {
                    isDark = !isDark;
                  });
                }),
          ],
        ),
        body: const Center(child: LoginPageClass()),
      ),
    );
  }
}

class LoginPageClass extends StatefulWidget {
  const LoginPageClass({super.key});
  @override
  State<LoginPageClass> createState() => _LoginPageClassState();
}

class _LoginPageClassState extends State<LoginPageClass> {
  @override
  Widget build(BuildContext context) {
    return Center(
    child: ListView(
    padding: const EdgeInsets.symmetric(horizontal: 24),
      children: <Widget>[
        const SizedBox(height: 80),
        Column(
          children:const <Widget>[
            Icon(Icons.diamond_outlined,color: Colors.indigo, size: 50),
            SizedBox(height: 20),
            Text("SHRINE")
          ]
        ),
      ]
    ),
    );
  }
}

