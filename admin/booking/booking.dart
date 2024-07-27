import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:ksy/log_in.dart';
import 'withbranch.dart';
import 'package:ksy/home.dart';


class BookingPage extends StatefulWidget {
   const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // ignore: unused_field
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Booking",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Agbalumo',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 254, 246, 246),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 35.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        elevation: 8,
      ),
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
                  "Hinata Shoyo",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("hinatashoyo@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  radius: 100,
                backgroundImage: AssetImage('assets/images/makima.webp'),
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          BookingCard(
            location: 'Bauan, Batangas',
            rating: 5.0,
            reviews: 9,
            time: '09:00 AM - 10:00 PM',
            image: 'images/bauan.jpg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BranchBooking()),
              );
              print('Bauan, Batangas card tapped');
            },
          ),
          BookingCard(
            location: 'Batangas City, Batangas',
            rating: 5.0,
            reviews: 9,
            time: '11:00 AM - 08:00 PM',
            image: 'images/batangas.jpg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BranchBooking()),
              );
              print('Batangas City, Batangas card tapped');
            },
          ),
          BookingCard(
            location: 'Malvar, Batangas',
            rating: 5.0,
            reviews: 9,
            time: '08:00 AM - 10:00 PM',
            image: 'images/malvar.jpg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BranchBooking()),
              );
              print('Malvar, Batangas card tapped');
            },
          ),
          BookingCard(
            location: 'Taguig, Batangas',
            rating: 5.0,
            reviews: 9,
            time: '08:00 AM - 10:00 PM',
            image: 'images/taguig.jpg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BranchBooking()),
              );
              print('Taguig, Batangas card tapped');
            },
          ),
          BookingCard(
            location: 'Mabini, Batangas',
            rating: 5.0,
            reviews: 9,
            time: '08:00 AM - 10:00 PM',
            image: 'images/mabini.jpg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BranchBooking()),
              );
              print('Mabini, Batangas card tapped');
            },
          ),
          BookingCard(
            location: 'San Pascual, Batangas',
            rating: 5.0,
            reviews: 9,
            time: '08:00 AM - 10:00 PM',
            image: 'images/san_pascual.jpg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BranchBooking()),
              );
              print('San Pascual, Batangas card tapped');
            },
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String location;
  final double rating;
  final int reviews;
  final String time;
  final String image;
  final VoidCallback onPressed;

  const BookingCard({
    Key? key,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.time,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 8,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '($reviews)',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Accept All Types of Appointment',
                      style: TextStyle(fontSize: 13, color: Colors.red),
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
  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BranchBooking(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
 
}
