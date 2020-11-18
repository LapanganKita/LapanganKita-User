import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;
import 'package:lapangankita_user/screen/booking_lapangan_screen.dart';

class detaillapangan extends StatefulWidget {
  @override
  _detaillapanganState createState() => _detaillapanganState();
}

class _detaillapanganState extends State<detaillapangan> {
  var isSelected = false;
  var icon = Icons.favorite_border;
  int _currentIndex = 0;
  List cardList = [Item1(), Item2(), Item3(), Item4()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Column(children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height / 3,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Colors.blueAccent,
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ]),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              padding: EdgeInsets.only(top: 16, left: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: HeadingText.withColor(
                        "Sport Centre Puncak Permai", 23, Colors.white),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 4),
                      child: Text(
                        "Surabaya",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Text(
                        "(22 Reviews)",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 92),
                        child: IconButton(
                          icon: Icon(
                            icon,
                            size: 30,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            // Respond to icon toggle
                            setState(() {
                              isSelected = !isSelected;
                              icon = isSelected
                                  ? Icons.favorite
                                  : Icons.favorite_border;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
                color: primary_color,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 24, right: 48, left: 48),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/images/11-park.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text("Parking")
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/images/11-park.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text("Parking")
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    "assets/images/11-park.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text("Parking")
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Image.asset(
                                "assets/images/placeholder.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text(
                                "Jl. Raya Darmo Permai III No.80, Pradahkalikendal, Kec. Dukuhpakis, Kota SBY",
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Image.asset(
                                "assets/images/phone.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text("0813-3359-5708"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Image.asset(
                                "assets/images/clock.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text("Mon-Sun"),
                            Text("06.00 - 23.00"),
                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 24),
                          child: HeadingText.withColor(
                              "Pilih Kategori", 20, primary_color)),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return BookingLapangan();
                                      }));
                                    }, // handle your image tap here
                                    child: Image.asset(
                                      'assets/images/basketball.png',
                                      fit: BoxFit
                                          .fill, // this is the solution for border
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "Basket",
                                      style: TextStyle(
                                          color: primary_color,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return BookingLapangan();
                                      }));
                                    }, // handle your image tap here
                                    child: Image.asset(
                                      'assets/images/basketball.png',
                                      fit: BoxFit
                                          .fill, // this is the solution for border
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "Basket",
                                      style: TextStyle(
                                          color: primary_color,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return BookingLapangan();
                                      }));
                                    }, // handle your image tap here
                                    child: Image.asset(
                                      'assets/images/basketball.png',
                                      fit: BoxFit
                                          .fill, // this is the solution for border
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "Basket",
                                      style: TextStyle(
                                          color: primary_color,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return BookingLapangan();
                                      }));
                                    }, // handle your image tap here
                                    child: Image.asset(
                                      'assets/images/basketball.png',
                                      fit: BoxFit
                                          .fill, // this is the solution for border
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "Basket",
                                      style: TextStyle(
                                          color: primary_color,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return BookingLapangan();
                                      }));
                                    }, // handle your image tap here
                                    child: Image.asset(
                                      'assets/images/basketball.png',
                                      fit: BoxFit
                                          .fill, // this is the solution for border
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "Basket",
                                      style: TextStyle(
                                          color: primary_color,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
        fit: BoxFit.fill,
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
        fit: BoxFit.fill,
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
        fit: BoxFit.fill,
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
        fit: BoxFit.fill,
      ),
    );
  }
}
