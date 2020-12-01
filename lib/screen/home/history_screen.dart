import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/constant.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;
import 'package:lapangankita_user/screen/detail_lapangan_screen.dart';

class historyScreen extends StatefulWidget {
  @override
  _historyScreenState createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primary_color),
      home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(),
              tabs: [
                Tab(
                  child: Text(
                    "Dalam Proses",
                  ),
                ),
                Tab(
                  child: Text("Riwayat"),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 5),
                                  blurRadius: 30)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Sport Centre Puncak Permai",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "Ubuntu",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "2020/08/20 - 18.00",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: "Ubuntu",
                                            ),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text("Status:"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            // RichText(
                            //   text: TextSpan(children: [
                            //     TextSpan(
                            //       text: "2020/08/20 - 18.00",
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //         fontFamily: "Ubuntu",
                            //       ),
                            //     ),

                            //   ]),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 5),
                                  blurRadius: 30)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Sport Centre Puncak Permai",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "Ubuntu",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "2020/08/20 - 18.00",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: "Ubuntu",
                                            ),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text("Status:"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            // RichText(
                            //   text: TextSpan(children: [
                            //     TextSpan(
                            //       text: "2020/08/20 - 18.00",
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //         fontFamily: "Ubuntu",
                            //       ),
                            //     ),

                            //   ]),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
