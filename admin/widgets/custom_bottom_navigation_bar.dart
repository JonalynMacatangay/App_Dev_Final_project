import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color backgroundColor;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Sales Report',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Appointments',
        ),
      ],
      currentIndex: selectedIndex,
      unselectedItemColor: Color.fromARGB(255, 251, 251, 251),
      selectedItemColor: Color.fromARGB(255, 221, 150, 191),
      onTap: onItemTapped,
    );
  }
}
