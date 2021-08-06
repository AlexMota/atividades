import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _index = 0;
  List<String> items = ['sdds', 'dssd'];
  bool isPalindrome;
  String matriz;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadList();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void loadList() {
    List<String> aux = [];

    for (double i = 1; i < 101; i++) {
      if (i % 3 == 0)
        aux.add('Fizz');
      else if (i % 5 == 0)
        aux.add('Bizz');
      else
        aux.add(i.toInt().toString());
    }

    setState(() {
      items = aux;
    });
  }

  void verifyPalindrome(String text) {
    String aux = text.replaceAll(' ', '').toLowerCase();
    print(aux);
    bool status = aux == aux.split('').reversed.join('');
    print(status);
    setState(() {
      isPalindrome = status;
    });
  }

  void resolveMatriz(String text) {
    String aux = text.replaceAll('[', '');
    aux = aux.replaceAll(']', '');
    print(aux);
    setState(() {
      matriz = aux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          if (_index == 0)
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                },
              ),
            ),
          if (_index == 1)
            Container(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      verifyPalindrome(value);
                    },
                  ),
                  if (isPalindrome != null)
                    Text(isPalindrome ? 'Palindromo' : 'Nao Palindromo'),
                ],
              ),
            ),
          if (_index == 2)
            Container(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      resolveMatriz(value);
                    },
                  ),
                  if (matriz != null)
                    Text(matriz),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This tr
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() => _index = value);
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'A'),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: 'B'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'C'),
        ],
      ),
      // ailing comma makes auto-formatting nicer for build methods.
    );
  }
}
