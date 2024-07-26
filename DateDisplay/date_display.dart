// date_display.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatelessWidget {
  final Alignment alignment;

  DateDisplay({this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(DateTime.now());

    return Container(
      alignment: alignment,
      child: Text(
        formattedDate,
        style: TextStyle(
          fontFamily: 'Comfortaa',
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
