import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.favorite_border_outlined),
        title: const Center(child: Text("AppBar HomePage")),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.alarm), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.navigation),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        centerTitle: true,
                        title: const Text('SecondPage AppBar'),
                        actions: <Widget>[
                          TextButton(
                              style: style,
                              child: const Text("SnackBar"),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("This is a Snackbar")),
                                );
                              }),
                          TextButton(
                              style: style,
                              child: const Text("Console"),
                              onPressed: () {
                                print("Pressed an Action Button");
                              }),
                          const SizedBox(width: 20),
                        ],
                      ),
                      body: const Center(
                        child: Text(
                          'This is the SecondPage',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              }),
          const SizedBox(width: 20),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("AppBar Home Page"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20),
                Icon(Icons.favorite_border_outlined, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                        "This is Leading Area: if you use drawer or navigator, Flutter use default icons in here")),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20),
                Text("AppBar HomePage"),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                        "This is TİTLE area. You can use 'const Center()' widget or 'centerTitle: true' to center the title")),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20),
                Icon(Icons.alarm, color: Colors.red),
                Icon(Icons.navigation, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                        "This is 'Actions' area. Use IconButton widget (search, profile etc...) ")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
