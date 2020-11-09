import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;
import 'package:table_calendar/table_calendar.dart';

class BookingLapangan extends StatefulWidget {
  @override
  _BookingLapanganState createState() => _BookingLapanganState();
}

class _BookingLapanganState extends State<BookingLapangan> {
  CalendarController _controller = CalendarController();
  String selectedPilihWaktu;
  String selectedNomerLapangan;
  @override
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
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
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(
                    top: 16, left: MediaQuery.of(context).size.width / 10),
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
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: primary_color,
                ),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.9,
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
                            text: "Booking",
                          ),
                          Tab(
                            text: "Details",
                          ),
                          Tab(
                            text: "Review",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      child: TabBarView(children: [
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            TableCalendar(
                              calendarController: _controller,
                              initialCalendarFormat: CalendarFormat.week,
                              headerStyle: HeaderStyle(
                                  centerHeaderTitle: true,
                                  formatButtonVisible: false,
                                  titleTextStyle: TextStyle(
                                      color: primary_color,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  leftChevronIcon: Icon(
                                    Icons.arrow_back_ios,
                                    color: primary_color,
                                    size: 16,
                                  ),
                                  rightChevronIcon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: primary_color,
                                    size: 16,
                                  ),
                                  leftChevronMargin: EdgeInsets.only(left: 72),
                                  rightChevronMargin:
                                      EdgeInsets.only(right: 72)),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 24),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Nomer Lapangan",
                                  style: TextStyle(
                                      color: primary_color,
                                      fontFamily: "Ubuntu",
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    changeNomerLapangan("lapangan1");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 24),
                                    height: 56,
                                    width: 56,
                                    decoration:
                                        (selectedNomerLapangan == "lapangan1")
                                            ? BoxDecoration(
                                                color: primary_color,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16)))
                                            : BoxDecoration(),
                                    child: Center(
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: (selectedNomerLapangan ==
                                                    "lapangan1")
                                                ? Colors.white
                                                : primary_color,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    changeNomerLapangan("lapangan2");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 24),
                                    height: 56,
                                    width: 56,
                                    decoration:
                                        (selectedNomerLapangan == "lapangan2")
                                            ? BoxDecoration(
                                                color: primary_color,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16)))
                                            : BoxDecoration(),
                                    child: Center(
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            color: (selectedNomerLapangan ==
                                                    "lapangan2")
                                                ? Colors.white
                                                : primary_color,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    changeNomerLapangan("lapangan3");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 24),
                                    height: 56,
                                    width: 56,
                                    decoration:
                                        (selectedNomerLapangan == "lapangan3")
                                            ? BoxDecoration(
                                                color: primary_color,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16)))
                                            : BoxDecoration(),
                                    child: Center(
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: (selectedNomerLapangan ==
                                                    "lapangan3")
                                                ? Colors.white
                                                : primary_color,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 24),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Pilih Waktu",
                                  style: TextStyle(
                                      color: primary_color,
                                      fontFamily: "Ubuntu",
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("00.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "00.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "00.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "00.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("01.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "01.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "01.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "01.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("02.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "02.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "02.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "02.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("03.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "03.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "03.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "03.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("04.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "04.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "04.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "04.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("05.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "05.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "05.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "05.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("06.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "06.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "06.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "06.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("07.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "07.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "07.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "07.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("08.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "08.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "08.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "08.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("09.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "09.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "09.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "09.00")
                                                      ? Colors.white
                                                      : Colors.grey
                                                          .withOpacity(0.4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("10.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "10.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "10.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "10.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("11.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "11.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "11.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "11.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("12.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "12.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "12.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "12.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("13.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "13.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "13.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "13.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("14.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "14.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "14.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "14.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("15.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "15.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "15.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "15.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("16.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "16.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "16.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "16.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("17.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "17.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "17.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "17.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("18.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "18.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "18.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "18.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("19.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "19.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "19.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "19.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("20.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "20.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "20.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "20.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("21.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "21.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "21.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "21.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("22.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "22.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "22.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "22.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          changePilihWaktu("23.00");
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 100,
                                          decoration:
                                              (selectedPilihWaktu == "23.00")
                                                  ? BoxDecoration(
                                                      color: primary_color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))
                                                  : BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              "23.00",
                                              style: TextStyle(
                                                  color: (selectedPilihWaktu ==
                                                          "23.00")
                                                      ? Colors.white
                                                      : primary_color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0)),
                                color: primary_color,
                                textColor: Colors.white,
                                onPressed: () {},
                                child: Text(
                                  "Booking Lapangan",
                                  style: TextStyle(
                                      fontFamily: "Ubuntu", fontSize: 18),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        )),
                        Text("Detail"),
                        Text("Reviw")
                      ])),
                ),
              ],
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
            ),
          ],
        ),
      ),
    );
  }

  void changeNomerLapangan(String noLapangan) {
    selectedNomerLapangan = noLapangan;
    setState(() {});
  }

  void changePilihWaktu(String pilihWaktu) {
    selectedPilihWaktu = pilihWaktu;
    setState(() {});
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
