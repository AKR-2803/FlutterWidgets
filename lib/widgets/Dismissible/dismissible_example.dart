//ref. : https://api.flutter.dev/flutter/widgets/Dismissible-class.html
//Tutorial : https://www.youtube.com/watch?v=iEMgjrfuc58

import 'package:flutter/material.dart';

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({Key? key}) : super(key: key);

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  //Using List.generate() :
  /*
  List.generate(int length , function<listType>());
  Example: 

  //Generate list of 10 integers from 0 to 9.
  List<int> integerList = List<int>.generate(10, (index){ return index + 1;});

  NOTE: The created list is fixed-length if [growable] is set to false.
  */

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
                    //Key is mandatory for Dismissible
                    key: ValueKey<Container>(containersList[index]),
                    //background when widget is swiped [L to R]
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.green,
                      child: const Text("Accept",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                    ),

                    //when swiped from other direction [R to L]
                    secondaryBackground: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: const Text("Dismiss",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15))),
                    //handle the onDismissed method else you'll get an error of dismissed item in widget tree
                    //Error: A dismissed Dismissible widget is still part of the tree.
                    //Make sure to implement onDismissed handler and to immediately
                    //remove the Dismissible widget from the application once that handler has fired.
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        containersList.removeAt(index);
                      });
                    },
                    child: containersList[index],
                  );
                })),
      ),
    );
  }
}
