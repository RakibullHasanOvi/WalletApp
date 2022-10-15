import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/HomePage.dart';
import 'package:wallets_app/Pages/Screen/profile.dart';
import 'package:wallets_app/Pages/Screen/report_screen.dart';
import 'package:wallets_app/models/pages/mbdetails.dart';

TextStyle _textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    ReportScreen(),
    // Center(
    //   child: Text('Report', style: _textStyle),
    // ),
    Center(
      child: Text('Menu', style: _textStyle),
    ),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              // backgroundColor: Colors.blue,
              // icon: Icon(
              //   Icons.home_outlined,
              //   size: 30,
              // ),
              icon: SvgPicture.asset(
                'assets/home.svg',
                color: _currentIndex == 0 ? Colors.red : Color(0xFF999999),
              ),
              // backgroundColor: Colors.red,
              label: "Home",

              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              // icon: Icon(
              //   Icons.electric_bolt,
              //   size: 30,
              // ),
              icon: SvgPicture.asset(
                'assets/Report.svg',
                color: _currentIndex == 1 ? Colors.red : Color(0xFF999999),
              ),
              // icon: Image.asset('assets/Report.png'),
              // backgroundColor: Colors.red,
              label: "Report",

              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              // icon: Icon(
              //   Icons.grid_view,
              //   size: 30,
              // ),
              icon: SvgPicture.asset(
                'assets/grid.svg',
                color: _currentIndex == 2 ? Colors.red : Color(0xFF999999),
              ),
              // icon: Image.asset('assets/grid.png'),
              // backgroundColor: Colors.red,
              label: "Menu",
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.pink,
              // icon: Icon(
              //   Icons.person,
              //   size: 30,
              // ),
              icon: SvgPicture.asset(
                'assets/Profiles.svg',
                color: _currentIndex == 3 ? Colors.red : Color(0xFF999999),
              ),
              // icon: Image.asset(
              //   'assets/Person1.webp',
              //   height: 25,
              // ),
              // backgroundColor: Colors.red,
              label: "Profile",
              backgroundColor: Colors.red,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
