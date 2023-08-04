import 'package:flutter/material.dart';

void main() => runApp(const SnackBarExampleApp());

class SnackBarExampleApp extends StatelessWidget {
  const SnackBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('SnackBar Sample')),
        body: const Center(
          child: SnackBarExample(),
        ),
      ),
    );
  }
}

class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text("Default SnackBar"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("This is a default SnackBar!"),
                action: SnackBarAction(
                  label: "Action",
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text("Customized SnackBar"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                width: 400,
                padding: const EdgeInsets.all(16),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.green,
                showCloseIcon: true,
                closeIconColor: Colors.black,
                dismissDirection: DismissDirection.vertical,
                elevation: 16,
                content: const Text("Customized SnackBar"),
                action: SnackBarAction(
                  label: "OK",
                  onPressed: () {
                    print("CustomizedSnackBar");
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
