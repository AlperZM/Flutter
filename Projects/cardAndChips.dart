import 'package:flutter/material.dart';

void main() => runApp(const InfoDisp());

class InfoDisp extends StatefulWidget {
  const InfoDisp({super.key});
  @override
  State<InfoDisp> createState() => _InfoDispState();
}

class _InfoDispState extends State<InfoDisp> {
  bool isDark = false;
  final iconLight =
      const Icon(Icons.light_mode_outlined, size: 35, color: Colors.amber);
  final iconDark = const Icon(Icons.dark_mode, size: 35, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Info Display Widgets")),
          actions: <Widget>[
            IconButton(
              icon: isDark ? iconLight : iconDark,
              tooltip: isDark ? "Ligh Mode" : "Dark Mode",
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Center(
          child: GridView.count(
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DemoCard(),
                      TappableCard(),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Card(
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Text("Elevated Card"),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            border: Border.all(
                              width: 1,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Outlined Card",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.yellowAccent,
                          child: Text("CE"),
                        ),
                        label: Text("Chip Examples"),
                      ),
                      const Divider(),
                      Wrap(
                        spacing: 10,
                        runSpacing: 5,
                        children: const <Widget>[
                          Chip(
                              avatar: CircleAvatar(
                                backgroundColor: Colors.yellow,
                                child: Icon(Icons.image),
                              ),
                              label: Text("Simple Chip")),
                          Divider(),
                          ChipDemos(),
                          Divider(),
                          ChoiceDemos(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.yellowAccent,
                          child: Text("CE"),
                        ),
                        label: Text("Other Chip Examples"),
                      ),
                      const Divider(),
                      Wrap(
                        spacing: 10,
                        runSpacing: 5,
                        children: const <Widget>[
                          Filter(),
                          ActionChips(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DemoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.icecream_sharp),
            title: Text("Card Title"),
            subtitle: Text("Subtitle of the ListTile"),
            trailing: Icon(Icons.money),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text("Buy IceCream"),
                onPressed: () {},
              ),
              const SizedBox(width: 20),
              TextButton(
                child: const Text("Buy MilkShake"),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TappableCard extends StatefulWidget {
  @override
  State<TappableCard> createState() => _TappableCardState();
}

class _TappableCardState extends State<TappableCard> {
  int clicks = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.cyan,
        onTap: () {
          setState(() => clicks++);
        },
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(15),
              child: Text("tappableCard tapped $clicks times.")),
        ),
      ),
    );
  }
}

class ChipDemos extends StatefulWidget {
  const ChipDemos({super.key});
  @override
  State<ChipDemos> createState() => _ChipDemosState();
}

class _ChipDemosState extends State<ChipDemos> {
  int inputs = 4;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            runSpacing: 5,
            children: List<Widget>.generate(
              inputs,
              (int index) {
                return InputChip(
                  label: Text("input Chip ${index + 1}"),
                  selected: selectedIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selectedIndex == index) {
                        selectedIndex = null;
                      } else {
                        selectedIndex = index;
                      }
                    });
                  },
                  onDeleted: () {
                    setState(() {
                      inputs = inputs - 1;
                    });
                  },
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                inputs = 4;
              });
            },
            child: const Text('Reset'),
          )
        ],
      ),
    );
  }
}

class ChoiceDemos extends StatefulWidget {
  const ChoiceDemos({super.key});
  @override
  State<ChoiceDemos> createState() => _ChoiceDemosState();
}

class _ChoiceDemosState extends State<ChoiceDemos> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Choice Chips"),
          const SizedBox(height: 5),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List<Widget>.generate(
              3,
              (int index) {
                return ChoiceChip(
                    label: Text("Choice ${index + 1}"),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    });
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

enum ExerciseFilter { walking, running, cycling, hiking }

class Filter extends StatefulWidget {
  const Filter({super.key});
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool favorite = false;
  List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Choose an execise', style: textTheme.labelLarge),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: ExerciseFilter.values.map((ExerciseFilter exercise) {
              return FilterChip(
                label: Text(exercise.name),
                selected: _filters.contains(exercise.name),
                onSelected: (bool value) {
                  setState(() {
                    if (value) {
                      if (!_filters.contains(exercise.name)) {
                        _filters.add(exercise.name);
                      }
                    } else {
                      _filters.removeWhere((String name) {
                        return name == exercise.name;
                      });
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10.0),
          Text('Looking for: ${_filters.join(', ')}'),
          const SizedBox(height: 10.0),
          ElevatedButton(
            child: const Text("Reset"),
            onPressed: () {
              setState(() {
                _filters = [];
              });
            },
          ),
        ],
      ),
    );
  }
}

class ActionChips extends StatefulWidget {
  const ActionChips({super.key});
  @override
  State<ActionChips> createState() => _ActionChipsState();
}

class _ActionChipsState extends State<ActionChips> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
          avatar: Icon(favorite ? Icons.favorite : Icons.favorite_border,
              color: favorite ? Colors.red : Colors.black),
          label: const Text("Add to Favorites"),
          onPressed: () {
            setState(() {
              favorite = !favorite;
            });
          }),
    );
  }
}
