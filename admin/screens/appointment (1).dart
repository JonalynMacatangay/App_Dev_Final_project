import 'package:flutter/material.dart';

void main() => runApp(AppointmentApp());

class AppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppointmentsPage(),
    );
  }
}

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  int _selectedIndex = 2;
  final List<Map<String, String>> appointments = [
    {
      'name': 'Mikha',
      'date': 'June 23, 2024',
      'type': 'Consultation Phone Call',
      'image': 'images/mikha.jpeg',
      'email': 'mikha@gmail.com',
      'phone': '0912345678',
      'address': 'Batangas City',
      'bookingTitle': 'Consultation Phone Call',
      'bookingID': '101',
      'status': 'Booked',
      'created': 'June 23, 2024',
    },
    {
      'name': 'Gwen',
      'date': 'June 23, 2024',
      'type': 'Consultation Phone Call',
      'image': 'images/Gwen.jpg',
      'email': 'maloi@gmail.com',
      'phone': '0923456789',
      'address': 'San Pascual',
      'bookingTitle': 'Consultation Phone Call',
      'bookingID': '102',
      'status': 'Booked',
      'created': 'June 23, 2024',
    },
    {
      'name': 'Colet',
      'date': 'June 23, 2024',
      'type': 'Consultation Phone Call',
      'image': 'images/Colet.jpeg',
      'email': 'stacey@gmail.com',
      'phone': '0934567890',
      'address': 'Lipa City',
      'bookingTitle': 'Consultation Phone Call',
      'bookingID': '103',
      'status': 'Booked',
      'created': 'June 23, 2024',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAppointmentTapped(BuildContext context, Map<String, String> appointment) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AppointmentDetailPage(appointment: appointment)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text('Appointments'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(appointment['image']!),
            ),
            title: Text(appointment['name']!),
            subtitle: Text('${appointment['type']}\n${appointment['date']}'),
            isThreeLine: true,
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => _onAppointmentTapped(context, appointment),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AppointmentDetailPage extends StatelessWidget {
  final Map<String, String> appointment;

  const AppointmentDetailPage({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text(appointment['name']!),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(appointment['image']!),
                ),
                title: Text(appointment['name']!),
                subtitle: Text('${appointment['type']}\n${appointment['date']}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Email: ${appointment['email']}'),
                    Text('Phone: ${appointment['phone']}'),
                    Text('Address: ${appointment['address']}'),
                    Text('Booking Title: ${appointment['bookingTitle']}'),
                    Text('Booking ID: ${appointment['bookingID']}'),
                    Text('Status: ${appointment['status']}'),
                    Text('Created: ${appointment['created']}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            const snackBar = SnackBar(content: Text("Booked status selected"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Booked button color
                          ),
                          child: Text('Booked'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            const snackBar = SnackBar(content: Text("Canceled status selected"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Canceled button color
                          ),
                          child: Text('Canceled'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
