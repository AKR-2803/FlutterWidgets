//reference : https://api.flutter.dev/flutter/material/DropdownButton-class.html#material.DropdownButton.1

import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

List<String> dropDownList = ["Item1", "Item2", "Item3", "Item4"];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = dropDownList.first;

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: ExampleName());
    return MaterialApp(
        // theme: ThemeData(useMaterial3: true),
        home: Scaffold(
            body: Center(
      child: DropdownButton<String>(
        //underline the menu, takes a Widget
        // underline: Container(color: Colors.redAccent, height: 2),
        //maximumHeight of the menu
        // menuMaxHeight: 50,
        //expand the menu to its parent's width
        // isExpanded: true,
        //drop-down button's icon
        icon: Icon(Icons.abc),
        iconEnabledColor: Colors.pinkAccent,
        dropdownColor: Color.fromARGB(255, 193, 174, 228),
        elevation: 1,
        borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(20), right: Radius.circular(20)),
        value: dropdownValue,
        items: dropDownList.map<DropdownMenuItem<String>>((String value) {
          //important : .toList()
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(color: Colors.black)),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    )));
  }
}
