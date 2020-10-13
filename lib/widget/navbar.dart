import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lapangankita_user/screen/home_screen.dart';
import 'package:lapangankita_user/screen/score_screen.dart';
import 'package:lapangankita_user/screen/profile_screen.dart';
import 'package:lapangankita_user/screen/history_screen.dart';

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
              icon: Icon(Icons.home, color: Color.fromARGB(255, 29, 97, 252)),
              title: Text(
                "Home",
                style: TextStyle(color: Color.fromARGB(255, 29, 97, 252)),
              ),
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.history, color: Color.fromARGB(255, 29, 97, 252)),
              title: Text(
                "History",
                style: TextStyle(color: Color.fromARGB(255, 29, 97, 252)),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.score, color: Color.fromARGB(255, 29, 97, 252)),
              title: Text(
                "Score",
                style: TextStyle(color: Color.fromARGB(255, 29, 97, 252)),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,
                  color: Color.fromARGB(255, 29, 97, 252)),
              title: Text(
                "Profile",
                style: TextStyle(color: Color.fromARGB(255, 29, 97, 252)),
              ),
            ),
          ],
        ));
  }
}
