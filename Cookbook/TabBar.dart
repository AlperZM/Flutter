import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("TabBar")),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.description)),
                Tab(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
                Tab(icon: Icon(Icons.account_balance)),
              ],
            ),
          ),
          body: Center(
            child: AppBody(),
          ),
        ),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 1"),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.radio_button_unchecked),
            title: Text("ShoppingList 1"),
            trailing: Icon(
              Icons.delete_outlined,
            ),
          ),
          ListTile(
            leading: Icon(Icons.radio_button_unchecked),
            title: Text("ShoppingList 2"),
            trailing: Icon(
              Icons.delete_outlined,
            ),
          ),
          ListTile(
            leading: Icon(Icons.radio_button_unchecked),
            title: Text("ShoppingList 3"),
            trailing: Icon(
              Icons.delete_outlined,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 2"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Total Price: "),
              SizedBox(width: 16),
              Text("100 \$"),
            ],
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 3"),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Bank Account: "),
              SizedBox(width: 16),
              Text("1000 \$"),
            ],
          ),
        ],
      ),
    ]);
  }
}
