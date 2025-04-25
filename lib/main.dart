import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'CouponsPage.dart';
import 'AccountPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Voyagers',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xFF0099FF),
          secondary: Color(0xFF94D4FF),
          surface: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
          // More colors
        ),
      ),
      home: const MainPage(title: 'Virtual Voyagers Home Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          return TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          );
        }),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: theme.primaryColor, size: 30),
            icon: Icon(Icons.home_outlined, color: theme.primaryColor, size: 30),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.confirmation_num, color: theme.primaryColor, size: 30),
            label: 'Coupons',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: theme.primaryColor, size: 30),
            label: 'Account',
          ),
        ],
      ),
      body:
      <Widget>[
        /// Home page
        HomePage(),

        /// Coupons page
        CouponsPage(),

        /// Account page
        AccountPage(),
      ][currentPageIndex],
    );
  }
}
