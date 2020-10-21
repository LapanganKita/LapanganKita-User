import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/screen/detailLapangan_screen.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;

class listLapangan extends StatefulWidget {
  @override
  _listLapanganState createState() => _listLapanganState();
}

class _listLapanganState extends State<listLapangan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primary_color,
          title: Text(
            "List Lapangan",
          )),
      body: Container(
          child: Container(
              margin: EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 16),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: primary_color),
                        labelText: 'Cari Lapangan',
                        hintText: "Nama Lapangan",
                        labelStyle:
                            TextStyle(color: primary_color),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: primary_color),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            width: MediaQuery.of(context).size.width - 72,
                            height: 180,
                            child: Card(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(50),
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return detaillapangan();
                                  }));
                                },
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
                                      width: MediaQuery.of(context).size.width -
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
                                              MainAxisAlignment.spaceBetween,
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
                            margin: EdgeInsets.only(bottom: 8),
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
                                      width: MediaQuery.of(context).size.width -
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
                                              MainAxisAlignment.spaceBetween,
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
                            margin: EdgeInsets.only(bottom: 8),
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
                                      width: MediaQuery.of(context).size.width -
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
                                              MainAxisAlignment.spaceBetween,
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
                            margin: EdgeInsets.only(bottom: 8),
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
                                      width: MediaQuery.of(context).size.width -
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
                                              MainAxisAlignment.spaceBetween,
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
                    ),
                  )
                ],
              ))),
    );
  }
}
