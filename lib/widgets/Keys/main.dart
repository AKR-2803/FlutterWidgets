import 'package:flutter/material.dart';
import 'color_state_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Widget> children;

  @override
  void initState() {
    super.initState();
    children = [
      //Unique is used to uniquely identify the widgets
      // and render them according to their state
      ColorStateWIdget(key: UniqueKey(), text: "1"),
      ColorStateWIdget(key: UniqueKey(), text: "2"),

      //we can also use ValueKey but make sure that they are unique else
      //error: Duplicate Keys found
      // ColorStateWIdget(key: ValueKey(1), text: "1"),
      // ColorStateWIdget(key: ValueKey(2), text: "2"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        )),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              swapTiles();
            },
            child: Icon(Icons.swap_horiz)),
      ),
    );
  }

  void swapTiles() {
    setState(() {
      final child = children.removeAt(0);
      children.insert(1, child);
    });
  }
}
