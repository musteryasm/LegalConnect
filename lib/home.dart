import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:law/chat.dart';
import 'package:law/select.dart';
import 'law.dart';
import 'fav.dart';
import 'setting.dart';
import 'info.dart';
import 'setting.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentIndex = 0;

  List<Widget> _screens = [
    law(),
    chat(),
    info(),
    setting(),
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
              gap: 5,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(16),
              onTabChange: _onTabChange,
              tabs: [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.chat, text: "Legal Bot"),
                GButton(icon: Icons.help, text: "LookUps"),
                GButton(icon: Icons.settings, text: "Settings"),
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


