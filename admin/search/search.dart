import 'package:flutter/material.dart';
import 'package:ksy/admin/profile_admin.dart';
import 'package:ksy/log_in.dart';
import 'package:ksy/main.dart';
import 'branch.dart';
import 'services.dart';
import 'staff.dart';

class SearchApp extends StatefulWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  _SearchAppState createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    SearchPage(), 
    Center(child: Text('Booking Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 142, 183),
        title: const Text("Search", textAlign: TextAlign.center),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: _pages[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 142, 183),
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 240, 142, 183)),
                accountName: Text(
                  "Jonalyn V. Macatangay",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("jonalynmacatangay@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 234, 254),
                  child: Text(
                    "JM",
                    style: TextStyle(fontSize: 30.0, color: Color.fromARGB(255, 243, 33, 131)),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
             onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Logout"),
                      content: Text("Are you sure you want to log out?"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("Log Out"),
                          onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  LoginForm()),
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
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedTabIndex = 1;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04), 
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                label: 'Branch',
                isActive: _selectedTabIndex == 0,
                onPressed: () {
                  _onTabSelected(0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()), 
                  );
                },
              ),
              TabButton(
                label: 'Service',
                isActive: _selectedTabIndex == 1,
                onPressed: () {
                  _onTabSelected(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicePage()),
                  );
                },
              ),
              TabButton(
                label: 'Staff',
                isActive: _selectedTabIndex == 2,
                onPressed: () {
                  _onTabSelected(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StaffPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  TabButton({required this.label, required this.isActive, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: isActive ? Colors.white : Colors.black,
        backgroundColor: isActive ? Colors.pink.shade100 : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(label),
    );
  }
}

class StaffList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        StaffCard(
          imageUrl: 'images/jhoanna.webp',
          name: 'Jhoanna',
          location: 'Taguig City',
          rating: 5,
        ),
        StaffCard(
          imageUrl: 'images/Aiah.jpeg',
          name: 'Aiah',
          location: 'Cavite',
          rating: 4,
        ),
        StaffCard(
          imageUrl: 'images/Colet.jpeg',
          name: 'Colet',
          location: 'Tanauan, Batangas',
          rating: 4,
        ),
        StaffCard(
          imageUrl: 'images/Gwen.jpg',
          name: 'Gwen',
          location: 'Lipa City',
          rating: 5,
        ),
        StaffCard(
          imageUrl: 'images/mikha.jpeg',
          name: 'Mikha',
          location: 'Novaliches',
          rating: 4,
        ),
      ],
    );
  }
}

class StaffCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final int rating;

  StaffCard({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 30,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(location),
                  Row(
                    children: List.generate(rating, (index) {
                      return Icon(Icons.star, color: Colors.amber, size: 16);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
