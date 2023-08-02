import 'package:flutter/material.dart';

void main() => runApp(const RichTextApp());

class RichTextApp extends StatelessWidget {
  const RichTextApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: const Center(child: Text("RichText"))),
          body: Center(
            child: RichTextBody(),
          )),
    );
  }
}

class RichTextBody extends StatelessWidget {
  RichTextBody({super.key});
  final TextStyle italic = TextStyle(
      fontSize: 18, fontStyle: FontStyle.italic, color: Colors.red.shade600);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.amber[400],
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(10),
          child: RichText(
            maxLines: 3,
            selectionColor: Colors.red,
            softWrap: true,
            textAlign: TextAlign.center,
            textScaleFactor: 1.5,
            text: TextSpan(
              text: "RichText ",
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                const TextSpan(
                    text: "This is TextSpan ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextSpan(text: " And other predefined text", style: italic),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
