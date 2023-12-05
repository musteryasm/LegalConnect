import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:law/lawyer.dart';
import 'package:law/request.dart';
import 'law.dart';
import 'fav.dart';
import 'setting.dart';
import 'info.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  int _currentIndex = 0;

  List<Widget> _screens = [
      lawyer(),
      request()
  ];

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
                bottom: Radius.circular(40)
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GNav(
              gap: 15,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(16),
              onTabChange: _onTabChange,
              tabs: [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.find_in_page, text: "Requests"),
              ],
              selectedIndex: _currentIndex,
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}


