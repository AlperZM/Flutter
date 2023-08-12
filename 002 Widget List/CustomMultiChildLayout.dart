import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("CustomMultiChildLayout")),
        body: Center(
          child: CustomMultiChildExampleScreen(),
        ),
      ),
    );
  }
}

class CustomMultiChildExampleScreen extends StatefulWidget {
  @override
  State<CustomMultiChildExampleScreen> createState() =>
      _CustomMultiChildExampleScreenState();
}

class _CustomMultiChildExampleScreenState
    extends State<CustomMultiChildExampleScreen> {
  double width = 300.0;
  double height = 150.0;
  double maxHeight = 50.0;
  double maxWidth = 50.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height,
            width: width,
            color: Colors.blue,
            child: CustomMultiChildLayout(
              delegate: _CustomMultiChildLayoutDelegate(
                  maxHeight: maxHeight, maxWidth: maxWidth),
              children: <Widget>[
                LayoutId(
                  id: 1,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Center(child: Text('1')),
                  ),
                ),
                LayoutId(
                  id: 2,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.green,
                    ),
                    child: const Center(child: Text('2')),
                  ),
                ),
                LayoutId(
                  id: 3,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.cyan,
                    ),
                    child: const Center(child: Text('3')),
                  ),
                ),
                LayoutId(
                  id: 4,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    child: const Center(child: Text('4')),
                  ),
                ),
                LayoutId(
                  id: 5,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purpleAccent),
                    child: const Center(child: Text('5')),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class _CustomMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  _CustomMultiChildLayoutDelegate({this.maxHeight, this.maxWidth});
  final maxHeight;
  final maxWidth;

  @override
  void performLayout(Size size) {
    if (hasChild(1)) {
      layoutChild(1, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      double dx = ((size.width / 2) - (maxWidth / 2));
      double dy = ((size.height / 2) - (maxHeight / 2));
      positionChild(1, Offset(dx, dy));
    }
    if (hasChild(2)) {
      layoutChild(2, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      double dx = -(maxWidth / 2);
      double dy = -((maxHeight / 2));
      positionChild(2, Offset(dx, dy));
    }
    if (hasChild(3)) {
      layoutChild(3, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      double dx = ((size.width) - (maxWidth / 2));
      double dy = -((maxHeight / 2));
      positionChild(3, Offset(dx, dy));
    }
    if (hasChild(4)) {
      layoutChild(4, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      double dx = ((size.width) - (maxWidth / 2));
      double dy = ((maxHeight * 2) + (maxHeight / 2));
      positionChild(4, Offset(dx, dy));
    }
    if (hasChild(5)) {
      layoutChild(5, BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight));
      double dx = -(maxWidth / 2);
      double dy = ((maxHeight * 2) + (maxHeight / 2));
      positionChild(5, Offset(dx, dy));
    }
  }

  @override
  bool shouldRelayout(_CustomMultiChildLayoutDelegate oldDelegate) {
    return (maxHeight != oldDelegate.maxHeight ||
        maxWidth != oldDelegate.maxWidth);
  }
}
