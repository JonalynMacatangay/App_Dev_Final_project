import 'package:admin_dashboard/screens/appointment%20(1).dart';
import 'package:admin_dashboard/screens/dashboard_screen.dart';
import 'package:admin_dashboard/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class SalesReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Report'),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Section(
              title: 'Sales Report',
              imageAsset: 'images/graph_1.png',
              dropdownValue: 'This Month',
            ),
            SizedBox(height: 10),
            Section(
              title: 'Sales & Expense Report',
              imageAsset: 'images/graph_2.png',
              dropdownValue: 'This Month',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 1,
        onItemTapped: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => getPageByIndex(index),
            ),
          );
        },
        backgroundColor: Colors.white,
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String dropdownValue;

  Section({required this.title, required this.imageAsset, required this.dropdownValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red[300],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {},
                  items: <String>['This Month', 'Last Month']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.asset(imageAsset),
          ],
        ),
      ),
    );
  }
}

Widget getPageByIndex(int index) {
  switch (index) {
    case 0:
      return DashboardScreen();
    case 1:
      return SalesReportPage();
    case 2:
      return AppointmentsPage();
    default:
      return DashboardScreen();
  }
}
