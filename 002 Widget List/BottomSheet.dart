import 'package:flutter/material.dart';

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('BottomSheetApp'))),
        body: const BottomSheetDemo(),
      ),
    );
  }
}

class BottomSheetDemo extends StatelessWidget {
  const BottomSheetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: const Text("Persistent Bottom Sheet"),
            onPressed: () {
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) {
                  return Container(
                    height: 300,
                    color: Colors.amber,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("""PersistenBottomSheet: 
                          To Close is press "back arrow" on the appbar or "close button"
                          Comes with LocalHistoryEntry and ModalRoute
                          Can add many widgets.
                          while this open, you can use the rest of app
                          """, style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            child: const Text("Print Console"),
                            onPressed: () {
                              print("Printed");
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              child: const Text("Alert Dialog"),
                              onPressed: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Alert title"),
                                        content: const Text("Alert Content"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("Ok"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              }),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            child: const Text("Close the Bottom Sheet"),
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
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text("Modal Bottom Sheet"),
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 300,
                      color: Colors.teal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text("""Modal Bottom Sheet:
                        to close this, you can press any space or "close" button,
                        alternate for persistentBottomSheet,
                        like warnings or informations, alert you can use this.
                        """, style: TextStyle(fontSize: 18)),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            child: const Text("Close Bottom Sheet"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
