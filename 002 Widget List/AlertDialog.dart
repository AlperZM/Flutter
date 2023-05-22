import 'package:flutter/material.dart';

void main() => runApp(const AlertDialogApp());

class AlertDialogApp extends StatelessWidget {
  const AlertDialogApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("AlertDialogApp"))),
        body: const Center(
          child: AlertDialogDemo(),
        ),
      ),
    );
  }
}

class AlertDialogDemo extends StatelessWidget {
  const AlertDialogDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text("Simple Alert Dialog"),
          onPressed: () {
            showDialog<String>(
              context: context,
              barrierDismissible: false, // user must tap button!
              barrierColor: Colors.amber,
              builder: (BuildContext context) => AlertDialog(
                title: const Text("Simple Alert Dialog Title"),
                content: const Text("Alert Dialog Description"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text("OK"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text("Customize Actions"),
          onPressed: () {
            showDialog<String>(
              context: context,
              barrierDismissible: true, // user must tap button!
              barrierColor: Colors.teal,
              builder: (BuildContext context) => AlertDialog(
                // Set background color
                backgroundColor: Colors.amberAccent,
                title: const Text("Set Actions Button Details"),
                content: const Text("Set Details, alignment, padding etc..."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text("OK"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: const Text("Cancel"),
                  ),
                ],

                //Set Action Buttons Details.
                actionsPadding: const EdgeInsets.all(16),
                actionsAlignment: MainAxisAlignment.center,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text("Second Alert Dialog"),
          onPressed: () {
            _dialogBuilder(context);
          },
        ),
      ],
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
      context: context,
// Sets a backgroundColor when dialog appears
      barrierColor: Colors.red,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.topCenter,
          title: const Text("Basic Alert Dialog"),
          content: const Text("Define Future<void> _dialogBuilder\n"
              "and add it an ElevatedButton"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
