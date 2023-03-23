import 'dart:math';

import 'package:flutter/material.dart';

class ColorStateWIdget extends StatefulWidget {
  const ColorStateWIdget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<ColorStateWIdget> createState() => _ColorStateWIdgetState();
}

class _ColorStateWIdgetState extends State<ColorStateWIdget> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = generateColor();
  }

  //generate random color everytime initState is called
  Color generateColor() {
    final random = Random();
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color,
      height: 150,
      width: 150,
      child: Text(
        widget.text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
