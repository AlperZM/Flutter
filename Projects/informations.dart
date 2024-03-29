import 'package:flutter/material.dart';

void main() => runApp(const InfoApp());

class InfoApp extends StatefulWidget {
  const InfoApp({super.key});
  @override
  State<InfoApp> createState() => _InfoAppState();
}

// for the ExpansionPanelList
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

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class _InfoAppState extends State<InfoApp> {
  bool _isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Information Widgets")),
          actions: <Widget>[
            IconButton(
                icon: _isDarkMode
                    ? const Icon(Icons.light_mode_outlined,
                        color: Colors.amberAccent, size: 35)
                    : const Icon(Icons.dark_mode_outlined,
                        color: Colors.black, size: 35),
                onPressed: () {
                  setState(() => _isDarkMode = !_isDarkMode);
                }),
            const SizedBox(width: 20),
          ],
        ),
        body: Center(
          child: GridView.count(
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            crossAxisCount: 4,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: _isDarkMode ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: AlertExample(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: _isDarkMode ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: DialogExample(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: _isDarkMode ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: ShowBottomSheet(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: _isDarkMode ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: ShowModalBottomSheet(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: _isDarkMode ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const DefaultSnackBar(),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: _isDarkMode ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: CustomSB(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: _isDarkMode ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: ExpansionPL(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertExample extends StatelessWidget {
  const AlertExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('Like Confirm in Web'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(Icons.warning_amber),
          Text("Alert Button"),
        ],
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text("This is Dialog Widget like alert in js"),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () => Navigator.pop(context, "Close"),
                  child: const Text("Close"),
                ),
              ],
            ),
          ),
        ),
      ),
      child: const Text("Simple Dialog Button"),
    );
  }
}

class ShowBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Scaffold.of(context).showBottomSheet<void>(
            (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.cyan[500],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('This is like a Widgett for the BottomSheet'),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Text("showBottomSheet"),
      ),
    );
  }
}

class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({super.key});

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DefaultSnackBar extends StatefulWidget {
  const DefaultSnackBar({super.key});
  @override
  State<DefaultSnackBar> createState() => _DefaultSnackBarState();
}

class _DefaultSnackBarState extends State<DefaultSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Default SnackBar"),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("This is a default snackbar"),
              action: SnackBarAction(
                label: "Snackbar Action",
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomSB extends StatefulWidget {
  const CustomSB({super.key});
  @override
  State<CustomSB> createState() => _CustomSBState();
}

class _CustomSBState extends State<CustomSB> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Customized SnackBar"),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            action: SnackBarAction(
              label: "Action",
              onPressed: () {},
            ),
            content: const Text("Customized snackBar!"),
            duration: const Duration(milliseconds: 2000),
            width: 300,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

class ExpansionPL extends StatefulWidget {
  const ExpansionPL({super.key});
  @override
  State<ExpansionPL> createState() => _ExpansionPLState();
}

class _ExpansionPLState extends State<ExpansionPL> {
  final List<Item> _data = generateItems(8);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
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
                  const Text('To delete this panel, tap the trash can icon'),
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
