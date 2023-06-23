import 'package:flutter/material.dart';

void main() => runApp(const DemosApp());

//-------->  parent class for MaterialApp
class DemosApp extends StatelessWidget {
  const DemosApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("DemosApp"))),
        body: const Center(child: DemosBody()),
      ),
    );
  }
}

class DemosBody extends StatefulWidget {
  const DemosBody({super.key});
  @override
  State<DemosBody> createState() => _DemosBodyState();
}

//---------> for body Satefulwidget
class _DemosBodyState extends State<DemosBody> {
  @override
  Widget build(BuildContext context) {
//---------> GridView, every cell has diffrnt widget
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(5),
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.blue[100],
          padding: const EdgeInsets.all(10),
          child: const Text("This is a collection of some widgets.",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blue[100],
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              const Text("AbsorbPointer"),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print("Pressed");
                  },
                  child: null,
                ),
              ),
              SizedBox(
                width: 50,
                height: 100,

// ABSORBS ALL CLICK EVENTS
                child: AbsorbPointer(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200],
                    ),
                    onPressed: () {
                      print("AbsorbPointer");
                    },
                    child: null,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(width: 100, height: 100, color: Colors.blue[100]),
        Container(width: 100, height: 100, color: Colors.blue[100]),
      ],
    );
  }
}
