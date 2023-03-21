import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({Key? key}) : super(key: key);

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  final _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: Colors.pink,
                  labelText: "Pick Date",
                  labelStyle: TextStyle(color: Colors.black),
                  icon: Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2024),
                    builder: (context, child) {
                      return Theme(
                          data: Theme.of(context).copyWith(
                            textTheme: TextTheme(
                                bodyMedium: TextStyle(color: Colors.white)),
                            colorScheme:
                                ColorScheme.dark(brightness: Brightness.dark),
                            textButtonTheme: TextButtonThemeData(
                              style:
                                  TextButton.styleFrom(primary: Colors.white),
                            ),
                            dialogBackgroundColor: Colors.black,
                          ),
                          child: child!);
                    },
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      _dateController.text = formattedDate.toString();
                    });
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
