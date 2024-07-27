// top_line.dart
import 'package:flutter/material.dart';

class TopLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Container(
         height: 1.0,
         color: Color.fromARGB(255, 107, 117, 123),
      ), // You can change the color to whatever you need
    );
  }
}
