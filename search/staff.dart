import 'package:flutter/material.dart';

void main() => runApp(const Staff());

class Staff extends StatelessWidget {
  const Staff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StaffPage(),
    );
  }
}

class StaffPage extends StatefulWidget {
  const StaffPage({Key? key}) : super(key: key);

  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  int _currentIndex = 1; // Set to 1 to default to Search Page
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
        backgroundColor: Colors.pink[100],
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _pages[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 142, 183),
              ), //BoxDecoration
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
                Navigator.pop(context);
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
                            Navigator.of(context).pop();
                            
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
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
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
            icon: Icon(Icons.calendar_today),
          ),
          
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(label: 'Branch', isActive: false),
                TabButton(label: 'Service', isActive: false),
                TabButton(label: 'Staff', isActive: true),
              ],
            ),
            SizedBox(height: 16),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              ),
            ),
            SizedBox(height: 16),
            // Filter Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.filter_list),
                label: Text('Filter'),
              ),
            ),
            // Staff List
            StaffList(),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;
  final bool isActive;

  TabButton({required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
    return Column(
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
