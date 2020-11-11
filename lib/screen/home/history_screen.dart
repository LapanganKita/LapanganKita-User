import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/constant.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;
import 'package:lapangankita_user/screen/detailLapangan_screen.dart';

class historyScreen extends StatefulWidget {
  @override
  _historyScreenState createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
            child: Container(
                margin:
                    EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        // height: MediaQuery.of(context).size.height / 1.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          alignment: Alignment.topCenter,
                          child: TabBar(
                            indicatorWeight: 0.01,
                            labelColor: primary_color,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: "Roboto"),
                            unselectedLabelStyle: TextStyle(),
                            tabs: <Widget>[
                              Tab(
                                text: "Active",
                              ),
                              Tab(
                                text: "Completed",
                              ),
                              Tab(
                                text: "Cancelled",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: MediaQuery.of(context).size.width,
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
                                                56,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
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
                                                        "Nama Lapangan",
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
                                                            "Lokasi",
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Status"),
                                                      Text("Waktu")
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
