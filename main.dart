import 'package:admin_dashboard/screens/Sales_report.dart';
import 'package:admin_dashboard/screens/appointment%20(1).dart';
import 'package:admin_dashboard/screens/dashboard_screen.dart';
import 'package:admin_dashboard/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SalonCustomerApp());
}

class SalonCustomerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon Customer App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        '/LoginPage': (context) => LoginPage(),
        '/Sales_report': (context) => SalesReportPage(),
        '/AppointmentsPage': (context) => AppointmentsPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/dashboard');
        break;
        case 2:
        Navigator.pushNamed(context, '/Sales_report');
        break;
      case 2:
        Navigator.pushNamed(context, '/appointments');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: GlobalKey<NavigatorState>(),
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/dashboard':
              builder = (BuildContext _) => DashboardScreen();
              break;
              case '/Sales_report':
              builder = (BuildContext _) => SalesReportPage();
              break;
            case '/AppointmentsPage':
              builder = (BuildContext _) => AppointmentsPage();
              break;
            default:
              builder = (BuildContext _) => DashboardScreen();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 230, 142, 171)),
    );
  }
}
