import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Add this for date formatting 
import 'package:ksy/booking/service_booking.dart';
import 'package:table_calendar/table_calendar.dart'; // Add this for the calendar
import 'booking.dart'; 
import 'checkout.dart';
import 'service_category.dart'; 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        primaryColor: Color.fromARGB(255, 254, 246, 246),
      ),
    );
  }
}

class DirectBooking extends StatefulWidget {
  const DirectBooking({Key? key}) : super(key: key);

  @override
  State<DirectBooking> createState() => _DirectBookingState();
}

class _DirectBookingState extends State<DirectBooking> {
  int _selectedIndex = 2;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 10, minute: 00);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 246, 246),
      appBar: AppBar(
        title: const Text(
          "Booking",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 254, 246, 246),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ServiceBooking()),
              );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/image1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Glowing Services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: const [
                      ServiceTile(title: 'BB Glow Korean Skin', price: 1500),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Color.fromARGB(255, 0, 0, 0),
                        indent: 10,
                        endIndent: 10,
                      ),
                      ServiceTile(title: 'BB Blush on', price: 1000),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Color.fromARGB(255, 0, 0, 0),
                        indent: 10,
                        endIndent: 10,
                      ),
                      ServiceTile(title: 'BB Glow + Blush on', price: 1999),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Color.fromARGB(255, 0, 0, 0),
                        indent: 10,
                        endIndent: 10,
                      ),
                      ServiceTile(title: 'Lip Tattoo', price: 1500),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Color.fromARGB(255, 0, 0, 0),
                        indent: 10,
                        endIndent: 10,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Add ons',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: GridView.count(
                      childAspectRatio: (1 / .6),
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      shrinkWrap: true,
                      children: const [
                        AddOnTile(title: 'Vitamin C', price: 149),
                        AddOnTile(title: 'Vitamin B Complex', price: 199),
                        AddOnTile(title: 'Placenta', price: 299),
                        AddOnTile(title: 'Collagen', price: 299),
                        AddOnTile(title: 'Stemcell', price: 399),
                        AddOnTile(title: 'L carnitine', price: 399),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
             padding:  EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  const Text(
                    "Select Date",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(
                        DateFormat('dd, MMMM yyyy').format(selectedDate),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Select Time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectTime(context),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(
                        selectedTime.format(context),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Checkout()),
              );
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 218, 74, 141),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Booking",
            icon: Icon(Icons.book),
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final int price;

  const ServiceTile({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      tileColor: const Color.fromARGB(255, 252, 252, 252),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '₱ $price',
            style: const TextStyle(color: Colors.pink),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.add_circle, color: Colors.pink),
        ],
      ),
    );
  }
}

class AddOnTile extends StatelessWidget {
  final String title;
  final int price;

  const AddOnTile({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center),
          const SizedBox(height: 2),
          Text(
            '₱ $price',
            style: const TextStyle(color: Colors.pink, fontSize: 11),
          ),
        ],
      ),
    );
  }
    Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DirectBooking(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
