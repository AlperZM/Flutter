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
                semanticLabel: "Simple Dialog",
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
          child: const Text("Scrollable Alert Dialog"),
          onPressed: () {
            showDialog<String>(
              context: context,
              barrierDismissible: false, // user must tap button!
              barrierColor: Colors.purple,
              builder: (BuildContext context) => AlertDialog(
                shadowColor: Colors.white,
                elevation: 50,
                semanticLabel: "Scrollable Dialog",
                scrollable: true,
                title: const Text("Scrollable Alert Dialog Title"),
                content: const Text("Scrollable\n"
"Alert\n""Dialog\n""Content\n""Scrollable\n""Alert\n""Dialog\n""Content\n""Scrollable\n"
"Alert\n""Dialog\n""Content\n""Scrollable\n""Alert\n""Dialog\n""Content\n"
"Scrollable\n""Alert\n""Dialog\n""Content\n""Scrollable\n""Alert\n"
"Dialog\n""Content\n""Scrollable\n""Alert\n""Dialog\n""Content\n"
"Scrollable\n""Alert\n""Dialog\n""Content\n"),
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
          child: const Text("Second Alert Dialog"),
          onPressed: () {
            _dialogBuilder(context);
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text("Custom Alert Dialog"),
          onPressed: () {
            _customDialogBuilder(context);
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
          semanticLabel: "Second Alert Dialog",
          alignment: Alignment.center,
          title: const Text("Second Alert Dialog"),
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

Future<void> _customDialogBuilder(BuildContext context) {
  return showDialog<void>(
      context: context,

      //BACKGROUND COLOR FOR THE REST OF THE PAGE
      barrierColor: Colors.blue,
      barrierDismissible: false, // must tap the actions button
      builder: (BuildContext context) {
        return AlertDialog(
          semanticLabel: "Customized Alert Dialog",
          // SET ELEVATION OF ALERT DIALOG
          elevation: 50,

          //SET PADDING FOR CONTENT
          contentPadding: const EdgeInsets.all(16),

          //SET BACKGROUND COLOR FOR ALERT DIALOG
          backgroundColor: Colors.yellowAccent,

          // SET ALIGNMENT OF THE ALERT DIALOG
          alignment: Alignment.bottomCenter,

          //ICON AREA
          iconPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          iconColor: Colors.red,
          icon: const Icon(Icons.warning_amber, size: 30),

          title: const Text("This Alert Widget is customized!"),
          content: const Text("Changed background\n"
              "Changed dialogs alignment\n"
              "Changed actions buttons alignment...\n"),
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
          //SET THE ALINGMENT FOR THE ACTIONS BUTTON
          actionsPadding: const EdgeInsets.all(16),
          actionsAlignment: MainAxisAlignment.spaceAround,
          buttonPadding: const EdgeInsets.all(16),
        );
      });
}
