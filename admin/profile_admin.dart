import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ksy/home.dart';
import 'package:ksy/log_in.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditProfileExpanded = false;
  bool _isBookingsExpanded = false;
  bool _isToReviewExpanded = false;
  bool _isLogoutExpanded = false;

  void _toggleExpansion(int index) {
    setState(() {
      if (index == 0) {
        _isEditProfileExpanded = !_isEditProfileExpanded;
      } else if (index == 1) {
        _isBookingsExpanded = !_isBookingsExpanded;
      } else if (index == 2) {
        _isToReviewExpanded = !_isToReviewExpanded;
      } else if (index == 3) {
        _isLogoutExpanded = !_isLogoutExpanded;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 246, 246),
      appBar: AppBar(
        title: const Text(
          "Profile",
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
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/makima.webp'), // Ensure the path is correct
              ),
              const SizedBox(height: 10),
              const Text(
                "Hinata Shoyo",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: const Icon(Icons.book, color: Colors.black),
                title: const Text(
                  "Bookings",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () => _toggleExpansion(1),
              ),
              if (_isBookingsExpanded)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    "No Current Bookings.",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ListTile(
                leading: const Icon(Icons.rate_review, color: Colors.black),
                title: const Text(
                  "To review",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () => _toggleExpansion(2),
              ),
              if (_isToReviewExpanded)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Image(
                    image: AssetImage('assets/images/review.png'), 
                  ),
                ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Logout"),
                        content: const Text("Are you sure you want to log out?"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text("Log Out"),
                            onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfilePage()),
                                );
                              },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
