import 'package:flutter/material.dart';

void main() => runApp(const AutocompleteApp());

class AutocompleteApp extends StatelessWidget {
  const AutocompleteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("AutocompleteApp"))),
        body: const Center(
          child: AutocompleteDemo(),
        ),
      ),
    );
  }
}

class AutocompleteDemo extends StatelessWidget {
  const AutocompleteDemo({super.key});

  static const List<String> _kOptions = <String>[
    "asdf",
    "bobcat",
    "chameleon",
    "wer",
    "kedi",
    "fgdfh",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text("Simple AutoComplateWidget", style: TextStyle(fontSize: 20)),
        Container(
          width: 300,
          height: 100,
          padding: const EdgeInsets.all(10),
          color: Colors.black12,
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return const Iterable<String>.empty();
              }
              return _kOptions.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              debugPrint("You just selected $selection");
            },
          ),
        ),
      ],
    );
  }
}
