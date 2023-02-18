import 'package:flutter/material.dart';

void main() => runApp(const ButtonsApp());

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

enum SampleItem { itemOne, itemTwo, itemThree }

class ButtonsApp extends StatelessWidget {
  const ButtonsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Buttons App"))),
        body: Buttons(),
        floatingActionButton: FloatingActionButton(
          tooltip: "FloatingActionButton",
          onPressed: () {},
          child: const Text("FAB"),
        ),
      ),
    );
  }
}

class Buttons extends StatefulWidget {
  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  String dropdownValue = list.first;
  SampleItem? selectedMenu;
  String popupMenuValue = "Select...";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
            ),
            width: 50,
            height: 30,
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.ads_click, size: 40),
                tooltip: "IconButton",
                onPressed: () {},
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
            ),
            width: 50,
            height: 30,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  foregroundColor: Colors.red,
                ),
                onPressed: () {},
                child: const Text("TextButton"),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
            ),
            width: 50,
            height: 30,
            child: Center(
              child: OutlinedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                  foregroundColor: Colors.red,
                ),
                onPressed: () {},
                child: const Text("OutlinedButton"),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
            ),
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 30,
            child: Center(
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text("ElevatedButton"),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
            ),
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 30,
            child: Center(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward, color: Colors.purple),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 3,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
            ),
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 30,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PopupMenuButton<SampleItem>(
                    initialValue: selectedMenu,
                    onSelected: (SampleItem item) {
                      setState(() {
                        selectedMenu = item;
                        popupMenuValue = selectedMenu.toString().split(".")[1];
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<SampleItem>>[
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemOne,
                        child: Text('Item 1'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemTwo,
                        child: Text('Item 2'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemThree,
                        child: Text('Item 3'),
                      ),
                    ],
                  ),
                  Center(child: Text(popupMenuValue)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
