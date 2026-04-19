
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget { // ✅ corrected
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _value = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Easy Slider", style: TextStyle(fontSize: _value ),),
          SizedBox(height: 20,),
          Slider(
            min: 10,
            max: 50,
            value: _value, onChanged: (value) {
              setState(() {
                _value = value;
                print(_value);
              }
              );
            },
          ),
        ]     
    
              
      ),
    );
  }
}