import 'package:flutter/material.dart';

class Staff {
  final String name;
  final String position;

  Staff({required this.name, required this.position});
}

class CustomSearchDelegate extends SearchDelegate {
  final List<Staff> staffList = [
    Staff(name: 'Alice Johnson', position: 'Manager'),
    Staff(name: 'Bob Smith', position: 'Developer'),
    Staff(name: 'Cathy Brown', position: 'Designer'),
    // Add more staff members as needed
  ];

  final List<String> otherTerms = [
    "Customers",
    "Services",
    "Support Tickets",
    "Settings and Configuration",
  ];

  CustomSearchDelegate(List<String> searchTerms);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<dynamic> matchQuery = [];
    for (var staff in staffList) {
      if (staff.name.toLowerCase().contains(query.toLowerCase()) ||
          staff.position.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(staff);
      }
    }
    for (var term in otherTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        if (matchQuery[index] is Staff) {
          final staff = matchQuery[index] as Staff;
          return ListTile(
            title: Text(staff.name),
            subtitle: Text(staff.position),
            onTap: () {
              // Handle staff item click
              query = staff.name;
              showResults(context);
            },
          );
        } else {
          final term = matchQuery[index] as String;
          return ListTile(
            title: Text(term),
            onTap: () {
              // Handle other term item click
              query = term;
              showResults(context);
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<dynamic> matchQuery = [];
    for (var staff in staffList) {
      if (staff.name.toLowerCase().contains(query.toLowerCase()) ||
          staff.position.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(staff);
      }
    }
    for (var term in otherTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        if (matchQuery[index] is Staff) {
          final staff = matchQuery[index] as Staff;
          return ListTile(
            title: Text(staff.name),
            subtitle: Text(staff.position),
            onTap: () {
              // Handle staff suggestion click
              query = staff.name;
              showResults(context);
            },
          );
        } else {
          final term = matchQuery[index] as String;
          return ListTile(
            title: Text(term),
            onTap: () {
              // Handle other term suggestion click
              query = term;
              showResults(context);
            },
          );
        }
      },
    );
  }
}
