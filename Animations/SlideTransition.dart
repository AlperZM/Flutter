import 'package:flutter/material.dart';

void main() => runApp(const SlideTransitionApp());

class SlideTransitionApp extends StatefulWidget {
  const SlideTransitionApp({super.key});
  @override
  State<SlideTransitionApp> createState() => _SlideTransitionAppState();
}

class _SlideTransitionAppState extends State<SlideTransitionApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("SlideTransition App")),
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
        body: const Center(child: SliderTransitionApp()),
      ),
    );
  }
}

class SliderTransitionApp extends StatefulWidget {
  const SliderTransitionApp({super.key});
  @override
  State<SliderTransitionApp> createState() => _SliderTransitionAppState();
}

class _SliderTransitionAppState extends State<SliderTransitionApp>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-0.2, 0.0),
    end: const Offset(0.4, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: const Offset(0.2, 0.0),
    end: const Offset(-0.4, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  late final Animation<Offset> _offsetAnimation3 = Tween<Offset>(
    begin: const Offset(0.0, -0.4),
    end: const Offset(0.0, 0.2),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  late final Animation<Offset> _offsetAnimation4 = Tween<Offset>(
    begin: const Offset(-0.3, -0.3),
    end: const Offset(0.3, 0.3),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: SlideTransition(
              position: _offsetAnimation,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.arrow_forward_outlined,
                    size: 40, color: Colors.red),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SlideTransition(
              position: _offsetAnimation2,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.arrow_back_outlined,
                    size: 40, color: Colors.green),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SlideTransition(
              position: _offsetAnimation3,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.arrow_upward_outlined,
                    size: 40, color: Colors.blue),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SlideTransition(
              position: _offsetAnimation4,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.south_east_outlined,
                    size: 40, color: Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
