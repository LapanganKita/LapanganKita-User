import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lapangankita_user/screen/home/home_screen.dart';
import 'package:lapangankita_user/screen/home/score_screen.dart';
import 'package:lapangankita_user/screen/home/profile_screen.dart';
import 'package:lapangankita_user/screen/home/history_screen.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;

class navBar extends StatefulWidget {
  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int _currentindex = 0;
  final List<Widget> _children = [
    homeScreen(),
    historyScreen(),
    scoreScreen(),
    profile_screen(),
  ];

  void onTabbedBar(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          onTap: onTabbedBar,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: primary_color),
              title: Text(
                "Home",
                style: TextStyle(color: primary_color),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, color: primary_color),
              title: Text(
                "History",
                style: TextStyle(color: primary_color),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.score, color: primary_color),
              title: Text(
                "Score",
                style: TextStyle(color: primary_color),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: primary_color),
              title: Text(
                "Profile",
                style: TextStyle(color: primary_color),
              ),
            ),
          ],
        ));
  }
}
