import 'package:flutter/material.dart';

void main() => runApp(const ExpansionPanelListApp());

class ExpansionPanelListApp extends StatelessWidget {
  const ExpansionPanelListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('ExpansionPanelList Sample')),
        body: const ExpansionPanelListExample(),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });
  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class RadioItem{}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(
    numberOfItems,
    (int index) {
      return Item(
        headerValue: "Panel ${index + 1}",
        expandedValue: "This is item no: ${index + 1}",
      );
    },
  );
}

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});
  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<Item> _data = generateItems(2);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Text("Simple ExpansionList"),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: SingleChildScrollView(
              child: Container(
                child: _buildPanel(),
              ),
            ),
          ),
          const Divider(),
          const Text("ExpansionPanelList.radio"),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: SingleChildScrollView(
              child: Container(
                child: _buildPanel(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text("To delete this panel, tap the trash can icon"),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
