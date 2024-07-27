import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:ksy/booking/booking.dart';
import 'package:ksy/search/search.dart';
import 'package:ksy/search/staff.dart';
import 'log.dart';
import 'log_in.dart';
import 'signup.dart';
import 'home.dart';
import 'search/branch.dart';
import 'search/services.dart'; 


// Function to trigger build when the app is run
void main() {
  runApp( 
     MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => LoginForm(),
        '/signup': (context) => SignUpApp(),
        '/home': (context) => const HomePage(),
        '/services':(context) =>  ServicePage(),
        '/branch':(context) => SearchScreen(),
        '/staff':(context) => StaffPage(),
        '/booking':(context) => const BookingPage(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(), 
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color.fromARGB(255, 254, 246, 246),
      ),
    );
  }
}
class SearchApp extends StatelessWidget {
  const SearchApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  ServicePage(), 
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color.fromARGB(255, 254, 246, 246),
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  const BookingPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  BookingPage(), 
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color.fromARGB(255, 254, 246, 246),
      ),
    );
  }
}