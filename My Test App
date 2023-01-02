import 'package:flutter/material.dart';

void main() => runApp(const TestApp());

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);
  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp props
      title: "MyTestApp",
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primarySwatch: Colors.cyan),
      color: Colors.amberAccent,
      supportedLocales: {const Locale("en", "")},
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        //appbar
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text("My Test App"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: "Add",
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: "Settings",
              onPressed: () {},
            ),
          ],
        ),
        // body
        body: Center(
          child: AppBody(),
        ),

        //float action button
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: const Icon(Icons.add),
          onPressed: () => {},
        ),

        // drawer
        drawer: AppDrawer(),

        //BOTTOM NAVIGATION BAR
        bottomNavigationBar: AppBottomNavBar(),
      ),
    );
  }
}

// body
class AppBody extends StatefulWidget {
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 160,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(color: Colors.blueAccent, width: 3),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.cyanAccent,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
              spreadRadius: 5.0,
            ),
          ]),
      child: RichText(
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        softWrap: true,
        maxLines: 1,
        textScaleFactor: 1,
        text: TextSpan(
          text: "Rich Text Element",
          style: DefaultTextStyle.of(context).style,
        ),
      ),
    );
  }
}

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //padding drawer
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: UserAccountsDrawerHeader(
              accountName: Text("Ivan Doe",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              accountEmail: Text("info@ivandoe.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: Text("I",
                    style: TextStyle(fontSize: 30, color: Colors.indigo)),
              ),
              currentAccountPictureSize: Size.square(50),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Friends"),
            leading: const Icon(Icons.people),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Contact"),
            leading: const Icon(Icons.mail),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class AppBottomNavBar extends StatefulWidget {
  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      fixedColor: Colors.green,
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontSize: 18,
      ),
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.account_circle),
        ),
      ],
      onTap: (int indexOfItem) {},
    );
  }
}
