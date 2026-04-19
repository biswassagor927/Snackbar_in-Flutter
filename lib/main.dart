import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Dismissible(
          key: ValueKey("abc"),

          // swipe right
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Icon(Icons.delete, color: Colors.white, size: 40),
          ),

          // swipe left
          secondaryBackground: Container(
            color: Colors.green,
            alignment: Alignment.centerRight,
            child: Icon(Icons.check, color: Colors.white, size: 40),
          ),

          child: ListTile(
            title: Text("Easy Explanation"),
            subtitle: Text("I love easy explanations"),
            trailing: Icon(Icons.ac_unit),
          ),
        ),
      ),
    );
  }
}