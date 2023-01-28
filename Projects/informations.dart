import 'package:flutter/material.dart';

void main() => runApp(const InfoApp());

class InfoApp extends StatefulWidget {
  const InfoApp({super.key});
  @override
  State<InfoApp> createState() => _InfoAppState();
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
                        color: Colors.black, size: 35)
                    : const Icon(Icons.dark_mode_outlined,
                        color: Colors.amber, size: 35),
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
                  child: DialogExample(),
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
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Alert Button 2"),
                  ),
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
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Alert Button 3"),
                  ),
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
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Alert Button 4"),
                  ),
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
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Alert Button 5"),
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

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
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
