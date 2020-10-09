import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  @override
  _navbarState createState() => _navbarState();
}

int _currentIndex = 0;

final tabs = [
  Center(child: Text('Home')),
  Center(child: Text('History')),
  Center(child: Text('Score')),
  Center(child: Text('Profile')),
];

class _navbarState extends State<navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title: Text('History'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.score),
                title: Text('Score'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Profile'),
                backgroundColor: Colors.white)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
