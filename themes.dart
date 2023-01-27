// text and color themes
// top of the MaterialApp()

        theme: ThemeData(
        //default Color Theme
         splashColor: Colors.red, // click effect
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[100],
       
       // set default themes icon color
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      // foregroundColor: Colors.red,
        
        // default text theme
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
        ),
      ),

// custom widget 

MaterialApp(
      theme: ThemeData(
        //default Color Theme
        splashColor: Colors.red,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[100],

        // default text theme
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Row(
            children: <Widget>[
              const Text("Hello World!"),
              Container(
                color: Theme.of(context).colorScheme.secondary,//Container theme
                child: Text(
                  'Text with a background color',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Theme(// customize FAB
          data: Theme.of(context).copyWith(splashColor: Colors.yellow),
          child:
              FloatingActionButton(onPressed: () {}, child: const Text("Add")),
        ),
      ),
    );
