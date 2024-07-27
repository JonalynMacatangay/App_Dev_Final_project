// date_display.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatelessWidget {
  final Alignment alignment;

  DateDisplay({this.alignment = Alignment.centerLeft});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMM d, yyyy').format(DateTime.now());
    
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Align(
        alignment: alignment,
        child: Text(
          formattedDate,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
