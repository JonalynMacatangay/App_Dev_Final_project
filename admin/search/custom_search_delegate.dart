import 'package:flutter/material.dart';

class Staff {
  final String name;
  final String position;

  Staff({required this.name, required this.position});
}

class CustomSearchDelegate extends SearchDelegate {
  final List<Staff> staffList;

  CustomSearchDelegate({required this.staffList});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Staff> matchQuery = [];
    for (var staff in staffList) {
      if (staff.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(staff);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name),
          subtitle: Text(result.position),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Staff> matchQuery = [];
    for (var staff in staffList) {
      if (staff.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(staff);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name),
          subtitle: Text(result.position),
          onTap: () {
            query = result.name;
            showResults(context);
          },
        );
      },
    );
  }
}
