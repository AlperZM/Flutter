import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const NavigationDrawerExample(),
      ),
    );

//-----> create template class for destinations
class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);
  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

//------> create destination list extends template
const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination(
      "Home Page",
      Icon(
        Icons.home_outlined,
      ),
      Icon(
        Icons.villa_outlined,
      )),
  ExampleDestination(
    "Settings Page",
    Icon(
      Icons.settings_outlined,
    ),
    Icon(
      Icons.build_outlined,
    ),
  ),
  ExampleDestination(
    "Profile Page",
    Icon(
      Icons.account_circle_outlined,
    ),
    Icon(
      Icons.person_outlined,
    ),
  ),
];

//-----> Home page
class NavigationDrawerExample extends StatefulWidget {
  const NavigationDrawerExample({super.key});
  @override
  State<NavigationDrawerExample> createState() =>
      _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<NavigationDrawerExample> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int screenIndex = 0;
  late bool showNavigationDrawer;
  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Widget buildBottomBarScaffold() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Page Index = $screenIndex"),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) {
          setState(
            () => screenIndex = index,
          );
        },
        destinations: destinations.map(
          (ExampleDestination destination) {
            return NavigationDestination(
              label: destination.label,
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            );
          },
        ).toList(),
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                  minWidth: 50,
                  destinations:
                      destinations.map((ExampleDestination destination) {
                    return NavigationRailDestination(
                      label: Text(destination.label),
                      icon: destination.icon,
                      selectedIcon: destination.selectedIcon,
                    );
                  }).toList(),
                  selectedIndex: screenIndex,
                  useIndicator: true,
                  onDestinationSelected: (int index) {
                    setState(
                      () => screenIndex = index,
                    );
                  }),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Page Index = $screenIndex"),
                  ElevatedButton(
                    onPressed: openDrawer,
                    child: const Text("OpenDrawer"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              "Header",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ...destinations.map((ExampleDestination destination) {
            return NavigationDrawerDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            );
          }),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer
        ? buildDrawerScaffold(context)
        : buildBottomBarScaffold();
  }
}
