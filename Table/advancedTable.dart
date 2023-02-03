import 'package:flutter/material.dart';

void main() => runApp(const Table2());

class Table2 extends StatefulWidget {
  const Table2({super.key});
  @override
  State<Table2> createState() => _Table2State();
}

class _Table2State extends State<Table2> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Advenced Template App")),
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
        body: const Center(
          child: AdvancedTable(),
        ),
      ),
    );
  }
}

class AdvancedTable extends StatefulWidget {
  const AdvancedTable({super.key});
  @override
  State<AdvancedTable> createState() => _AdvancedTableState();
}

class _AdvancedTableState extends State<AdvancedTable> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text("Number")),
          DataColumn(label: Text("Icons")),
        ],
        rows: List<DataRow>.generate(
          numItems,
          (int index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.08);
                }
                if (index.isEven) {
                  return Colors.grey.withOpacity(0.3);
                }
                return null;
              }),
              cells: <DataCell>[
                DataCell(
                  Text("Row $index"),
                ),
                const DataCell(
                  Icon(Icons.more_outlined),
                ),
              ],
              selected: selected[index],
              onSelectChanged: (bool? value) {
                setState(() {
                  selected[index] = value!;
                });
              }),
        ),
      ),
    );
  }
}
