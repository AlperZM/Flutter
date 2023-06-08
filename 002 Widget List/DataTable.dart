import 'package:flutter/material.dart';

void main() => runApp(const DataTableApp());

class DataTableApp extends StatelessWidget {
  const DataTableApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("DataTableApp"))),
        body: const Center(
          child: DemoApp(),
        ),
      ),
    );
  }
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DataTable(
          sortColumnIndex: 0,
          sortAscending: true,
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(
              label: Text("Year"),
              numeric: true,
            ),
            DataColumn(label: Icon(Icons.flutter_dash)),
          ],
          rows: const [
            DataRow(selected: true, cells: [
              DataCell(Text("Dash")),
              DataCell(Text("2023")),
              DataCell(Icon(Icons.flutter_dash_outlined)),
            ]),
            DataRow(cells: [
              DataCell(Text("Gopher")),
              DataCell(Text("2023")),
              DataCell(Icon(Icons.dashboard)),
            ]),
          ],
        ),
      ],
    );
  }
}
