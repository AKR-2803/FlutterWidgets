import 'package:flutter/material.dart';

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({Key? key}) : super(key: key);

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  //0 to 9 integers list
  // List<int> intList = List<int>.generate(10, (index) {
  //   return index + 1;
  // });

  List<Container> containersList = List<Container>.generate(
    10,
    (index) => Container(
      alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      color: index % 2 == 0 ? Colors.blueGrey : Colors.amber,
      child: Text(
        "Item no. $index   <-Swipe->",
        style: TextStyle(
            color: index % 2 != 0 ? Colors.black : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dismissible Widget"),
          backgroundColor: Colors.teal,
        ),
        body: Center(
            child: ListView.builder(
                itemCount: containersList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey<Container>(containersList[index]),
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.green,
                      child: const Text("Accept",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                    ),
                    secondaryBackground: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: const Text("Dismiss",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15))),
                    onDismissed: (DismissDirection direction) {
                      setState(() {});
                    },
                    child: containersList[index],
                  );
                })),
      ),
    );
  }
}
