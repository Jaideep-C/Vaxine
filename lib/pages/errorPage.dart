import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key key, this.text}) : super(key: key);
  final String text;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error page")),
      body: Center(
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
