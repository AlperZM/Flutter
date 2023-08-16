import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("Drawer"))),
        body: Center(
          child: AppBody(),
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child:
          Text("Drawer Widgets", style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: "Drawer",
      shadowColor: Colors.cyanAccent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan[400],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          color: Colors.amber[400], width: 50, height: 50),
                      const FlutterLogo(size: 50)
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text("Flutter", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text("ivanDoe@ivan.com",
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, size: 20, color: Colors.green),
            title:
                Text("Profile", style: Theme.of(context).textTheme.titleMedium),
            trailing: const Icon(Icons.more_horiz),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.message, size: 20, color: Colors.blue),
            title: Text("Messages",
                style: Theme.of(context).textTheme.titleMedium),
            trailing: const Icon(Icons.more_horiz),
            onTap: () {},
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 2),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextButton.icon(
                onPressed: () {},
                label: const Text('Logout'),
                icon: const Icon(Icons.logout)),
          ),
        ],
      ),
    );
  }
}
