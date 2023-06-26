import 'package:flutter/material.dart';

void main() => runApp(const ImgApp());

class ImgApp extends StatelessWidget {
  const ImgApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("IMG APP"))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 10.0,
                        blurRadius: 5.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Image(
                    alignment: Alignment(0.5, -1),
                    semanticLabel: "Owl",
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  )),
              const SizedBox(height: 20),
              Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 10.0,
                        blurRadius: 5.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')),
            ],
          ),
        ),
      ),
    );
  }
}
