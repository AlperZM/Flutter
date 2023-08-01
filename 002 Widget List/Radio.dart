import 'package:flutter/material.dart';

void main() => runApp(const InputRadio());

class InputRadio extends StatelessWidget {
  const InputRadio({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("InputRadio"))),
        body: const Center(child: InputRadioDemo()),
      ),
    );
  }
}

class InputRadioDemo extends StatefulWidget {
  const InputRadioDemo({super.key});
  @override
  State<InputRadioDemo> createState() => _InputRadioDemoState();
}

enum MainDrinks { tea, coffee, soda }

enum Flavours { sugar, milk, ice }

class _InputRadioDemoState extends State<InputRadioDemo> {
  MainDrinks? _mainDrinks = MainDrinks.tea;
  Flavours? _flavour = Flavours.sugar;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Choose Your Drink!",
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 170,
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 51, 204, 255), width: 1),
                borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Radio<MainDrinks>(
                        value: MainDrinks.tea,
                        groupValue: _mainDrinks,
                        onChanged: (MainDrinks? value) {
                          setState(() {
                            _mainDrinks = value;
                          });
                        }),
                    title: const Text("Tea"),
                  ),
                  ListTile(
                    leading: Radio<MainDrinks>(
                        value: MainDrinks.coffee,
                        groupValue: _mainDrinks,
                        onChanged: (MainDrinks? value) {
                          setState(
                            () => _mainDrinks = value,
                          );
                        }),
                    title: const Text("Coffee"),
                  ),
                  ListTile(
                    leading: Radio<MainDrinks>(
                      value: MainDrinks.soda,
                      groupValue: _mainDrinks,
                      onChanged: (MainDrinks? value) {
                        setState(
                          () => _mainDrinks = value,
                        );
                      },
                    ),
                    title: const Text("Soda"),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 50,
              top: 30,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromARGB(255, 51, 204, 255), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Choose Main Drink',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 170,
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 51, 204, 255), width: 1),
                borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Radio<Flavours>(
                        value: Flavours.sugar,
                        groupValue: _flavour,
                        onChanged: (Flavours? value) {
                          setState(() {
                            _flavour = value;
                          });
                        }),
                    title: const Text("Sugar"),
                  ),
                  ListTile(
                    leading: Radio<Flavours>(
                        value: Flavours.milk,
                        groupValue: _flavour,
                        onChanged: (Flavours? value) {
                          setState(() {
                            _flavour = value;
                          });
                        }),
                    title: const Text("Milk"),
                  ),
                  ListTile(
                    leading: Radio<Flavours>(
                        value: Flavours.ice,
                        groupValue: _flavour,
                        onChanged: (Flavours? value) {
                          setState(() {
                            _flavour = value;
                          });
                        }),
                    title: const Text("Ice"),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 50,
              top: 30,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromARGB(255, 51, 204, 255), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Choose Flavour',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
