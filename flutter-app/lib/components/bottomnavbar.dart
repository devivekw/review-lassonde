import 'package:flutter/material.dart';

// Bottom Nav-Bar
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

// Pallete
import 'package:ratemycourse/components/pallete.dart';

class GoogleNavBar extends StatefulWidget {
  @override
  _GoogleNavBarState createState() => _GoogleNavBarState();
}

class _GoogleNavBarState extends State<GoogleNavBar> {
  int _selectedIndex = 0;

  Color _selectTabBgColor(int index) {
    if (index == 0)
      return Pallete.passionateRed;
    else if (index == 1)
      return Pallete.creativeMaroon;
    else
      return Pallete.confidentGreen;
  }

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 25,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            duration: Duration(milliseconds: 500),
            tabBackgroundColor: _selectTabBgColor(_selectedIndex),
            tabs: [
              GButton(
                icon: LineIcons.book,
                text: 'Courses',
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              _onTabChange(index);
              print("From Google Class $index");
            },
          ),
        ),
      ),
    );
  }
}
