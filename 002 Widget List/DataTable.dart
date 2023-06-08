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
//---------------> set the table border
          border: TableBorder.all(
              width: 1,
              style: BorderStyle.solid,
              borderRadius: BorderRadius.circular(5)),
//------------->  set the colum spacing
          columnSpacing: 50,

// ---------------> set dataTextStle
          dataTextStyle: const TextStyle(
              fontSize: 18, color: Colors.brown, fontWeight: FontWeight.bold),

          //----------> Set Header Color
          headingRowColor: MaterialStateProperty.all(Colors.tealAccent),

// -----------> Divider thickness
          dividerThickness: 2,

          sortColumnIndex: 0,
          sortAscending: true,
          columns: const [
            DataColumn(label: Expanded(child: Text("Name"))),
            DataColumn(
              label: Text("Year"),
              numeric: true,
            ),
            DataColumn(label: Icon(Icons.flutter_dash)),
          ],
          rows: [
            DataRow(
// -------------> set row color
                color: MaterialStateProperty.all(Colors.green[100]),
                cells: const [
                  DataCell(Text("Dash")),
                  DataCell(Text("2023")),
                  DataCell(Icon(Icons.flutter_dash_outlined)),
                ]),
            DataRow(
                color: MaterialStateProperty.all(Colors.orange[100]),
                cells: const [
                  DataCell(Text("Gopher")),
                  DataCell(Text("2023")),
                  DataCell(Icon(Icons.dashboard)),
                ]),
          ],
        ),
        const SizedBox(height: 20),
        const Text("Demo Table",
            style: TextStyle(fontSize: 22, color: Colors.red)),
        DataTable(
          sortColumnIndex: 0,
          sortAscending: true,
          columns: const <DataColumn>[
            DataColumn(
                label: Text("Langulage",
                    style: TextStyle(fontSize: 20, color: Colors.blue))),
            DataColumn(
                label: Text("Year",
                    style: TextStyle(fontSize: 20, color: Colors.blue))),
            DataColumn(
                label: Text("Icon",
                    style: TextStyle(fontSize: 20, color: Colors.blue))),
            DataColumn(
                label: Text("Color",
                    style: TextStyle(fontSize: 20, color: Colors.blue))),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                const DataCell(Text("HTML")),
                const DataCell(Text("1990")),
                const DataCell(Icon(Icons.html)),
                DataCell(Container(
                  width: 20,
                  height: 20,
                  color: Colors.red,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text("CSS")),
                const DataCell(Text("1992")),
                const DataCell(Icon(Icons.css)),
                DataCell(Container(width: 20, height: 20, color: Colors.orange))
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text("javaScript")),
                const DataCell(Text("1993")),
                const DataCell(Icon(Icons.javascript_outlined)),
                DataCell(
                    Container(width: 20, height: 20, color: Colors.yellow)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text("Dart")),
                const DataCell(Text("2000")),
                const DataCell(Icon(Icons.flutter_dash_sharp)),
                DataCell(Container(width: 20, height: 20, color: Colors.blue))
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text("Flutter")),
                const DataCell(Text("2001")),
                const DataCell(Icon(Icons.flutter_dash_rounded)),
                DataCell(Container(width: 20, height: 20, color: Colors.teal)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
