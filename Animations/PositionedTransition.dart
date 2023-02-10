import 'package:flutter/material.dart';

void main() => runApp(const PosTransitionApp());

class PosTransitionApp extends StatefulWidget {
  const PosTransitionApp({super.key});
  @override
  State<PosTransitionApp> createState() => _PosTransitionAppState();
}

class _PosTransitionAppState extends State<PosTransitionApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("PositionedTransition App")),
          actions: <Widget>[
            Center(
              child: Text(
                isDark ? "LIGHT" : "DARK",
                style: TextStyle(
                    fontSize: 20,
                    color: isDark ? Colors.amberAccent : Colors.black),
              ),
            ),
            const SizedBox(width: 15),
            Switch(
                value: isDark,
                activeColor: Colors.amber,
                onChanged: (bool value) {
                  setState(() {
                    isDark = !isDark;
                  });
                }),
          ],
        ),
        body: const Center(child: PositionTransitionApp()),
      ),
    );
  }
}

class PositionTransitionApp extends StatefulWidget {
  const PositionTransitionApp({super.key});
  @override
  State<PositionTransitionApp> createState() => _PositionTransitionAppState();
}

class _PositionTransitionAppState extends State<PositionTransitionApp>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallSize = 50;
    const double bigSize = 160;
    return Container(
      margin: const EdgeInsets.all(15),
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              final Size biggest = constraints.biggest;
              return Stack(
                children: <Widget>[
                  PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            const Rect.fromLTWH(0, 0, smallSize, smallSize),
                            biggest),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(biggest.width - bigSize,
                                biggest.height - bigSize, bigSize, bigSize),
                            biggest),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.elasticInOut,
                      )),
                      child: Container(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ))),
                ],
              );
            }),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              final Size biggest = constraints.biggest;
              return Stack(
                children: <Widget>[
                  PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            const Rect.fromLTWH(10, 10, smallSize, smallSize),
                            biggest),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(biggest.width - bigSize,
                                biggest.height - bigSize, bigSize, bigSize),
                            biggest),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.elasticInOut,
                      )),
                      child: Container(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ))),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
