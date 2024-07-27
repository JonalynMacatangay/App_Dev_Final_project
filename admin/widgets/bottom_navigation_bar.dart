
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped, required MaterialColor backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 255, 182, 182),

          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Appointments',
        )
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red.shade300,
      unselectedItemColor: Colors.black54,
      onTap: onItemTapped,
    );
  }
}
