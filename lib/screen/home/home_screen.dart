import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lapangankita_user/components/constant.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/screen/list_lapangan_screen.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;
import 'package:lapangankita_user/net/firebase.dart';
import 'package:lapangankita_user/screen/viewmore/viewmore_favorite.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  void initState() {
    super.initState();
    GetUsername.Currentusername();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width),
                decoration: BoxDecoration(color: primary_color),
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
                        child: Text(username,
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
                                elevation: 8,
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
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return listLapangan(tipe : "Basket");
                                  }));
                                },
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
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return listLapangan(tipe : "Futsal");
                                  }));
                                },
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
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return listLapangan(tipe : "Badminton");
                                  }));
                                },
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
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.asset(
                                            "assets/images/basketball.png"),
                                      ],
                                    )),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return listLapangan(tipe : "pingpong");
                                  }));
                                },
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
          DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                            child: HeadingText.withColor(
                                "Favorite", 36, primary_color)),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return viewMoreFavorite();
                                      }));
                                    },
                                    child: Text("View More"),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          72,
                                      height: 180,
                                      child: Card(
                                        child: InkWell(
                                          splashColor:
                                              Colors.blue.withAlpha(50),
                                          onTap: () {},
                                          child: Container(
                                              child: Stack(
                                            fit: StackFit.expand,
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Container(
                                                child: Image.network(
                                                  "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    80,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white60,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          HeadingText.withColor(
                                                            "Lapangan ASD",
                                                            16,
                                                            primary_color,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                              ),
                                                              Text(
                                                                "Location",
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                            ],
                                                          ),
                                                          Text("30k - 40k")
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        elevation: 8,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          72,
                                      height: 180,
                                      child: Card(
                                        child: InkWell(
                                          splashColor:
                                              Colors.blue.withAlpha(30),
                                          onTap: () {},
                                          child: Container(
                                              child: Stack(
                                            fit: StackFit.expand,
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Container(
                                                child: Image.network(
                                                  "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    80,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white60,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          HeadingText.withColor(
                                                            "Lapangan ASD",
                                                            16,
                                                            primary_color,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                              ),
                                                              Text(
                                                                "Location",
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                            ],
                                                          ),
                                                          Text("30k - 40k")
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        elevation: 8,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          72,
                                      height: 180,
                                      child: Card(
                                        child: InkWell(
                                          splashColor:
                                              Colors.blue.withAlpha(30),
                                          onTap: () {},
                                          child: Container(
                                              child: Stack(
                                            fit: StackFit.expand,
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Container(
                                                child: Image.network(
                                                  "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    80,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white60,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          HeadingText.withColor(
                                                            "Lapangan ASD",
                                                            16,
                                                            primary_color,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                              ),
                                                              Text(
                                                                "Location",
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                              Icon(Icons
                                                                  .star_border),
                                                            ],
                                                          ),
                                                          Text("30k - 40k")
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        elevation: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, bottom: 24),
                          child: HeadingText.withColor(
                              "Lapangan", 36, primary_color),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 72,
                                height: 180,
                                child: Card(
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(50),
                                    onTap: () {},
                                    child: Container(
                                        child: Stack(
                                      fit: StackFit.expand,
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Container(
                                          child: Image.network(
                                            "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              80,
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white60,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    HeadingText.withColor(
                                                      "Lapangan ASD",
                                                      16,
                                                      Color.fromARGB(
                                                          255, 29, 97, 252),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                        ),
                                                        Text(
                                                          "Location",
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                      ],
                                                    ),
                                                    Text("30k - 40k")
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                  elevation: 8,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 72,
                                height: 180,
                                child: Card(
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {},
                                    child: Container(
                                        child: Stack(
                                      fit: StackFit.expand,
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Container(
                                          child: Image.network(
                                            "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              80,
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white60,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    HeadingText.withColor(
                                                      "Lapangan ASD",
                                                      16,
                                                      Color.fromARGB(
                                                          255, 29, 97, 252),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                        ),
                                                        Text(
                                                          "Location",
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                      ],
                                                    ),
                                                    Text("30k - 40k")
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                  elevation: 8,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 72,
                                height: 180,
                                child: Card(
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {},
                                    child: Container(
                                        child: Stack(
                                      fit: StackFit.expand,
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Container(
                                          child: Image.network(
                                            "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              80,
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white60,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    HeadingText.withColor(
                                                      "Lapangan ASD",
                                                      16,
                                                      Color.fromARGB(
                                                          255, 29, 97, 252),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                        ),
                                                        Text(
                                                          "Location",
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border),
                                                      ],
                                                    ),
                                                    Text("30k - 40k")
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                  elevation: 8,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.8,
          ),
        ],
      )),
    );
  }
}
