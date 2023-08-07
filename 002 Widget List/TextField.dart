import 'package:flutter/material.dart';

void main() => runApp(const TextFieldExampleApp());

class TextFieldExampleApp extends StatelessWidget {
  const TextFieldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("TextField"))),
        body: const Center(child: TextFieldExample()),
      ),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  late TextEditingController _controller;
  String placeHolder = "Some String";
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: TextField(
            autocorrect: true,
            autofocus: false,
            cursorColor: Colors.red,
            cursorHeight: 24,
            cursorOpacityAnimates: true,
            cursorRadius: const Radius.circular(5),
            cursorWidth: 5,
            decoration: const InputDecoration(
              icon: Icon(Icons.send),
              hintText: 'Hint Text',
              helperText: '',
//         counterText: '0 characters',
              border: OutlineInputBorder(),
            ),
            buildCounter: counter,
            controller: _controller,
            onSubmitted: (String? value) {
              setState(() {
                print(value);
              });
            },
          ),
        ),
      ),
    );
  }
}

Widget counter(
  BuildContext context, {
  required int currentLength,
  required int? maxLength,
  required bool isFocused,
}) {
  maxLength = 10;
  return Text(
    '$currentLength of $maxLength characters',
    semanticsLabel: 'character count',
  );
}
