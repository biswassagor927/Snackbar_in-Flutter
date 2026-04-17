
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

// ❌ StatelessWidget ছিল, কিন্তু state ব্যবহার করা হচ্ছে → ঠিক করা হয়েছে
class Home extends StatefulWidget { // ✅ corrected
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // ✅ UI better placement
        child: ElevatedButton(
          onPressed: () {
            // ❌ Scaffold.of(context).showSnackBar deprecated → ঠিক করা হয়েছে
            ScaffoldMessenger.of(context).showSnackBar( // ✅ corrected
              SnackBar(
                content: Text("I am a SnackBar"),
                duration: Duration(seconds: 10),
                action: SnackBarAction(
                  label: "ok",
                  onPressed: () {},
                ),
              ),
            );
          },
          child: Text('Press me'),
        ),
      ),
    );
  }
}