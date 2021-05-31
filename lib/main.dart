import 'package:flutter/material.dart';
import 'package:mod/pages/querypage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(title: Center(child: Text("Vaccine slots for next 7 days"))),
        body: QueryPage(),
      ),
    );
  }
}
