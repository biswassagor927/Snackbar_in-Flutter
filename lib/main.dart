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

  String? selectedValue;

  List<String> items = ["One", "Two", "Three", "Four", "Five"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // 🔹 label changes when an item is selected
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  selectedValue ?? "Choose",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue, // label highlight color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 8),

              // 🔹 Dropdown field
              DropdownButtonFormField<String>(
                value: selectedValue,
                hint: Text("Select option"),

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),

                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: selectedValue == item
                            ? Colors.blue // 🔥 selected highlight
                            : Colors.black,
                        fontWeight: selectedValue == item
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  );
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                  if (newValue != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: $newValue')),
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}