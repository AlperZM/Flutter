import 'package:flutter/material.dart';

void main() => runApp(const TableApp());

class TableApp extends StatefulWidget {
  const TableApp({super.key});
  @override
  State<TableApp> createState() => _TableAppState();
}

class _TableAppState extends State<TableApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Basic Table App")),
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
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: isDark ? Colors.yellow : Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AppTable(),
          ),
        ),
      ),
    );
  }
}

class AppTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              "Name",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Age",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Role",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text("Gumball")),
            DataCell(Text("16")),
            DataCell(
              Text("Student"),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text("Darwin")),
            DataCell(Text("16")),
            DataCell(
              Text("Student"),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text("Simeon")),
            DataCell(Text("5000")),
            DataCell(
              Text("Teacher"),
            ),
          ],
        ),
      ],
    );
  }
}
