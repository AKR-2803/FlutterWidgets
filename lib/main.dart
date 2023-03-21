import 'package:flutter/material.dart';
import 'package:widgetspractice/widgets/DatePicker/date_picker_example.dart';
import 'package:widgetspractice/widgets/Fittedbox/fittedbox_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> dropDownList = ["Item1", "Item2", "Item3", "Item4"];

class _MyAppState extends State<MyApp> {
  String dropdownValue = dropDownList.first;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FittedboxExample());
  }
}
