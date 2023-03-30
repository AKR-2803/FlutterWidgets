import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemChromeExample extends StatefulWidget {
  const SystemChromeExample({Key? key}) : super(key: key);

  @override
  State<SystemChromeExample> createState() => _SystemChromeExampleState();
}

class _SystemChromeExampleState extends State<SystemChromeExample> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    //statusBarColor is the color of the bar displaying percentage in the device
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        //upper status bar color, (battery, notification bar)
        statusBarColor: Colors.cyanAccent,

        //bottom navigation bar color (back button, home button bar)
        systemNavigationBarColor: Colors.pink.shade50,

        //the color of divider between bottom navigation bar and  app's content.
        //see image for reference
        systemNavigationBarDividerColor: Colors.orange.shade500,

        //brightness of the status bar (to be explored)
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("SystemChrome Example", style: TextStyle(fontSize: 30))),
    );
  }
}
