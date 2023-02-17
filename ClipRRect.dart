//ClipRRect crop images
import 'package:flutter/material.dart';
void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is
//the root of your application.
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'ClipOval',
	theme: ThemeData(
		primarySwatch: Colors.blue,
	),
	home: MyHomePAGE(),
	debugShowCheckedModeBanner: false,
	);
}
}

class MyHomePAGE extends StatefulWidget {
@override
_MyHomePAGEState createState() => _MyHomePAGEState();
}

class _MyHomePAGEState extends State<MyHomePAGE> {
@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: Text('GeeksforGeeks'),
		backgroundColor: Colors.green,
	),
	body: Center(
		child: ClipRRect(
			borderRadius:
			BorderRadius.circular(10),
			child: Image.network('https://picsum.photos/250?image=9'),
			),
		)
	);
}
}

class MyClip extends CustomClipper<Rect> {
Rect getClip(Size size) {
	return Rect.fromLTWH(0, 0, 100, 100);
}

bool shouldReclip(oldClipper) {
	return false;
}
}
