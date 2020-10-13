import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 29, 97, 252)),
              ),
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 32, top: 48),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 32),
                        child: Text("Trevincen Tambunan",
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 32, top: 32, bottom: 16),
                      child: Text("Category : ",
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(32, 16, 32, 0),
                          child: Column(
                            children: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                color: Colors.white,
                                child: Container(
                                  width: 48,
                                  height: 73,
                                  decoration: BoxDecoration(),
                                  child: Image.asset(
                                      "assets/images/basketball.png"),
                                ),
                                onPressed: () {},
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Basket",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 16, 32, 0),
                          child: Column(
                            children: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                color: Colors.white,
                                child: Container(
                                  width: 48,
                                  height: 73,
                                  decoration: BoxDecoration(),
                                  child: Image.asset(
                                      "assets/images/basketball.png"),
                                ),
                                onPressed: () {},
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Futsal",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 16, 32, 0),
                          child: Column(
                            children: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                color: Colors.white,
                                child: Container(
                                  width: 48,
                                  height: 73,
                                  decoration: BoxDecoration(),
                                  child: Image.asset(
                                      "assets/images/basketball.png"),
                                ),
                                onPressed: () {},
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Badminton",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 16, 32, 0),
                          child: Column(
                            children: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                color: Colors.white,
                                child: Container(
                                  width: 48,
                                  height: 73,
                                  decoration: BoxDecoration(),
                                  child: Image.asset(
                                      "assets/images/basketball.png"),
                                ),
                                onPressed: () {},
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "Ping Pong",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: (MediaQuery.of(context).size.width),
                  height: (MediaQuery.of(context).size.height / 2.1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
