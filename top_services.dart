import 'package:flutter/material.dart';

class TopServicesBox extends StatelessWidget {
  final List<Service> services = [
    Service('Glutathione IV Push', 62),
    Service('Gluta Fairy Push', 78),
    Service('Cinderella Drip', 59),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink[400],
              ),
            ),
            SizedBox(height: 16.0),
            DataTable(
              columns: [
                DataColumn(label: Text('#')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Popularity')),
                DataColumn(label: Text('Sales')),
              ],
              rows: List<DataRow>.generate(
                services.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(Text(services[index].name)),
                    DataCell(
                      Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          Container(
                            width: (100 * services[index].popularity / 100).toDouble(),
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.pink[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(Text('${services[index].popularity}%')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final String name;
  final int popularity;

  Service(this.name, this.popularity);
}
