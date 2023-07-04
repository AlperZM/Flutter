import 'package:flutter/material.dart';

void main() => runApp(const ListTileApp());

class ListTileApp extends StatelessWidget {
  const ListTileApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("ListTileApp"))),
        body: const Center(
          child: ListTileDemo(),
        ),
      ),
    );
  }
}

class ListTileDemo extends StatelessWidget {
  const ListTileDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.face_outlined,
              color: Colors.green,
              size: 30,
            ),
            title: const Text("Simple ListTile",
                style: TextStyle(fontSize: 20, color: Colors.green)),
            subtitle: const Text("This is subtitle "),
            onTap: () {},
          ),
          Card(
            color: Colors.grey[100],
            child: ListTile(
              leading: const FlutterLogo(size: 30),
              title: const Text("ListTile in a Card()"),
              subtitle: const Text("Change some optins"),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert, size: 40),
                onPressed: () {},
              ),
              onTap: () {},
            ),
          ),
          Card(
            color: Colors.amber[100],
            child: ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                size: 40,
                color: Colors.red,
              ),
              title: const Text("Custom ListTile"),
              subtitle: const Text(
                  "This Listtile has 3 lines so it has more text and more..."),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.more_vert, size: 30, color: Colors.cyan),
                onPressed: () {},
              ),
              onTap: () {},
              contentPadding: const EdgeInsets.all(8),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('One-line dense ListTile'),
              dense: true,
            ),
          ),
          Card(
            color: Colors.grey[100],
            child: ListTile(
              iconColor: Colors.blue,
              horizontalTitleGap: 20,
              hoverColor: Colors.redAccent,
              leading: const FlutterLogo(size: 30),
              title: const Text("Another ListTile"),
              subtitle: const Text("Change more optins"),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert, size: 40),
                onPressed: () {},
              ),
              onTap: () {},
            ),
          ),
          Card(
            color: Colors.grey[100],
            child: ListTile(
              minLeadingWidth: 50,
              minVerticalPadding: 20,
              leading: const Text("Leading"),
              title: const Text("ListTile Title"),
              subtitle: const Text("Subtitle"),
              trailing: const Text("trailing"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
