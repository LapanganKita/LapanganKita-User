import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lapangankita_user/models/bottom_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:lapangankita_user/screen/register_screen.dart';

class navBar extends StatefulWidget {
  @override
  _navBarState createState() => _navBarState();
}

enum BottomIcons { Home, History, Score, Profile }

class _navBarState extends State<navBar> {
  BottomIcons bottomIcons = BottomIcons.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          bottomIcons == BottomIcons.Home
              ? Center(
                  child: Text(
                    "Hi, this is home page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.History
              ? Center(
                  child: Text(
                    "Hi, this is favorite page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.Score
              ? Center(
                  child: Text(
                    "Hi, this is search page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.Profile
              ? Center(
                  child: Text(
                    "Hi, this is account page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Home;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Home ? true : false,
                      icons: EvaIcons.home,
                      text: "Home"),
                  BottomBar(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegisterScreen();
                        }));

                        setState(() {
                          bottomIcons = BottomIcons.History;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.History ? true : false,
                      icons: Icons.history,
                      text: "History"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Score;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Score ? true : false,
                      icons: Icons.score,
                      text: "Score"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Profile;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Profile ? true : false,
                      icons: Icons.account_circle,
                      text: "Profile"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
