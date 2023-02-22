import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("To Do List"),
          titleSpacing: 0.0,
          centerTitle: true,
          toolbarHeight: 70,
          toolbarOpacity: 0.8,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          width: 180,
          height: 60,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white70,
            border: Border.all(color: Colors.teal, width: 5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.tealAccent,
                spreadRadius: 5.0,
                blurRadius: 7.0,
                offset: Offset(1, 3),
              ),
            ],
          ),
          child: const Text("Learn Dart"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  accountName: Text(
                    "Account Name",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  accountEmail: Text("jo@jojo.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Text(
                      "A",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue,
                      ),
                    ),
                  ),
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
              leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: (){Navigator.pop(context);},
              ),
              ListTile(
              leading: const Icon(Icons.logout),
                title: const Text("Log Out"),
                onTap: (){Navigator.pop(context);},
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false, //Removing Debug Banner
    );
  }
}
