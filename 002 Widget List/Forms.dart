import 'package:flutter/material.dart';

void main() => runApp(const FormApp());

class FormApp extends StatelessWidget {
  const FormApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("FormApp"))),
        body: const Center(child: FormDemo()),
      ),
    );
  }
}

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});
  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.tealAccent,
            offset: Offset(1, 1),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Email",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text("Submit"),
              ),
            ),
            const Divider(
              thickness: 3,
              indent: 30,
              endIndent: 30,
            ),
          ],
        ),
      ),
    );
  }
}
