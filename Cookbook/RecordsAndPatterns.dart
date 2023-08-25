//https://codelabs.developers.google.com/codelabs/dart-patterns-records#5
import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(const DocumentApp());

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DocumentScreen(
        document: Document(),
      ),
    );
  }
}

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({
    super.key,
    required this.document,
  });
  final Document document;
  @override
  Widget build(BuildContext context) {
    final metadataRecord = document.metadata;
    return Scaffold(
      appBar: AppBar(
        title: Text(metadataRecord.$1),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last Modified: ${metadataRecord.modified}'),
          ),
        ],
      ),
    );
  }
}

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode(documentJson);
  (String, {DateTime modified}) get metadata {
    const title = "My Document";
    final now = DateTime.now();
    return (title, modified: now);
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';
