import 'package:flutter/material.dart';

void main() => runApp(const InfoApp());

class InfoApp extends StatefulWidget {
  const InfoApp({super.key});
  @override
  State<InfoApp> createState() => _InfoAppState();
}

class _InfoAppState extends State<InfoApp> {
  final Icon _iconsD =
      const Icon(Icons.dark_mode_outlined, color: Colors.amber, size: 35);
  final Icon _iconsL =
      const Icon(Icons.light_mode_outlined, color: Colors.black, size: 35);
  bool _isOk = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isOk ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Info Widgets")),
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
              // alert widget
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: _isOk ? Colors.black : Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Icon(Icons.warning_outlined),
                            Text("Alert Dialog Title"),
                          ],
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Icon(Icons.report_problem_outlined),
                            Text("Alert Dialog Descripton"),
                          ],
                        ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.info_outlined),
                          Text("Alert Button"),
                        ]),
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
