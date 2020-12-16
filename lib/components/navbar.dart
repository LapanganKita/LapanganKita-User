part of 'components.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentindex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    HistoryScreen(),
    ScoreScreen(),
    ProfileScreen(),
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
