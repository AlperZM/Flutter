import 'package:flutter/material.dart';

void main() => runApp(const SlidersApp());

class SlidersApp extends StatelessWidget {
  const SlidersApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("SlidersApp")),
        body: const Center(child: AppBody()),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  double _slider1Value = 20;
  double _slider2Value = 20;
  double _slider3Value = 40;
  var _slider4Value = const RangeValues(20, 80);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Slider(
              value: _slider1Value,
              max: 100,
              divisions: 5,
              label: _slider1Value.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _slider1Value = value;
                });
              }),
        ),
        const SizedBox(height: 20),
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Slider(
              value: _slider2Value,
              secondaryTrackValue: _slider3Value,
              max: 100,
              divisions: 10,
              label: _slider2Value.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _slider2Value = value;
                });
              }),
        ),
        const SizedBox(height: 20),
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Slider(
              value: _slider3Value,
              activeColor: Colors.teal,
              max: 100,
              divisions: 10,
              label: _slider3Value.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _slider3Value = value;
                });
              }),
        ),
        const SizedBox(height: 20),
        Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: RangeSlider(
              values: _slider4Value,
              activeColor: Colors.teal,
              inactiveColor: Colors.black,
              min: 0,
              max: 100,
              divisions: 10,
              labels:
                  RangeLabels("${_slider4Value.start}", "${RangeLabels.new}"),
              onChanged: (RangeValues value) {
                setState(() {
                  _slider4Value = value;
                });
              }),
        ),
      ],
    );
  }
}
