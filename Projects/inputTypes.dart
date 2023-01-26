import 'package:flutter/material.dart';

void main() => runApp(const InputApp());

class InputApp extends StatefulWidget {
  const InputApp({super.key});
  @override
  State<InputApp> createState() => _InputAppState();
}

enum BgColor { teal, amber, white } //for radio buttons

double _currentSliderValue = 1; // for the slider

bool light = false; // for the switch

late TextEditingController _controller;

class _InputAppState extends State<InputApp> {
  BgColor? _bgColor = BgColor.white;
  Color _selectBgColor = Colors.white;
  final Icon _iconsD =
      const Icon(Icons.dark_mode_outlined, color: Colors.amber, size: 35);
  final Icon _iconsL =
      const Icon(Icons.light_mode_outlined, color: Colors.black, size: 35);
  bool _isOk = true;
  bool isChecked = false;

  @override // for text field
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return MaterialApp(
      theme: _isOk ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Input andSelections")),
          actions: <Widget>[
            IconButton(
                icon: _isOk ? _iconsL : _iconsD,
                onPressed: () {
                  setState(() {
                    _isOk = !_isOk;
                  });
                }),
            const SizedBox(width: 20),
          ],
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    const Text("Input"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _selectBgColor,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: const Text("Teal"),
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      leading: Radio<BgColor>(
                        value: BgColor.teal,
                        groupValue: _bgColor,
                        onChanged: (BgColor? value) {
                          setState(() {
                            _bgColor = value;
                            _selectBgColor = Colors.teal;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Amber"),
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      leading: Radio<BgColor>(
                        value: BgColor.amber,
                        groupValue: _bgColor,
                        onChanged: (BgColor? value) {
                          setState(() {
                            _bgColor = value;
                            _selectBgColor = Colors.amber;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("White"),
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      leading: Radio<BgColor>(
                        value: BgColor.white,
                        groupValue: _bgColor,
                        onChanged: (BgColor? value) {
                          setState(() {
                            _bgColor = value;
                            _selectBgColor = Colors.white;
                          });
                        },
                      ),
                    ),
                    const Text("Radio"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 5,
                        divisions: 5,
                        label: _currentSliderValue.toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        }),
                    const Text("Slider"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: light ? Colors.amberAccent[700] : Colors.grey,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.tungsten_outlined,
                      size: 45,
                      color: light ? Colors.yellow : Colors.white,
                    ),
                    Switch(
                        value: light,
                        activeColor: Colors.amberAccent,
                        onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                        }),
                    const Text("Switch"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Date and Time Pickers"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _controller,
                      onSubmitted: (String value) async {
                        await showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thanks!'),
                              content: Text(
                                  'You typed "$value", which has length ${value.characters.length}.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    const Text("Text Field"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
