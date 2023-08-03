import 'package:flutter/material.dart';

void main() => runApp(const SegmentedButtonApp());

class SegmentedButtonApp extends StatelessWidget {
  const SegmentedButtonApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("SegmentedButtonApp"))),
        body: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text("Single Choice"),
            SingleChoice(),
            Spacer(),
            Text("Multi Choice"),
            MultiChoice(),
            Spacer()
          ],
        )),
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});
  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
        segments: const <ButtonSegment<Calendar>>[
          ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text("Day"),
            icon: Icon(Icons.calendar_view_day),
          ),
          ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text("Week"),
            icon: Icon(Icons.calendar_view_week),
          ),
          ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text("Month"),
            icon: Icon(Icons.calendar_view_month),
          ),
          ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text("Year"),
            icon: Icon(Icons.calendar_today),
          ),
        ],
        selected: <Calendar>{
          calendarView
        },
        onSelectionChanged: (Set<Calendar> newSelection) {
          setState(() {
            calendarView = newSelection.first;
          });
        });
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultiChoice extends StatefulWidget {
  const MultiChoice({super.key});
  @override
  State<MultiChoice> createState() => _MultiChoiceState();
}

class _MultiChoiceState extends State<MultiChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      multiSelectionEnabled: true,
      emptySelectionAllowed: true,
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text("XS")),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text("S")),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text("M")),
        ButtonSegment<Sizes>(value: Sizes.large, label: Text("L")),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text("XL")),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
    );
  }
}
