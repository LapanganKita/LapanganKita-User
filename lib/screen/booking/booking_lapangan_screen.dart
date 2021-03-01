part of 'bookings.dart';

// ignore: must_be_immutable
class BookingLapangan extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  Lap lapangan;
  final ValueChanged<bool> isSelected;
  BookingLapangan({Key key, this.lapangan, this.isSelected}) : super(key: key);
  _BookingLapanganState createState() => _BookingLapanganState(lapangan);
}

class _BookingLapanganState extends State<BookingLapangan> {
  List itemList = [
    "00:00",
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "05:00",
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00",
    "21:00",
    "22:00",
    "23:00"
  ];
  List selectedList = [];

  Lap lapangan;
  CollectionReference trans =
      FirebaseFirestore.instance.collection("Transactions");
  _BookingLapanganState(this.lapangan);
  CalendarController _controller = CalendarController();
  String selectedPilihWaktu;
  String selectedNomerLapangan;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  String name = "";
  List time = [];

  void getUserUpdate() async {
    userCollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .snapshots()
        .listen((event) {
      name = event.data()['name'];
      setState(() {});
    });
  }

  void checkIfFavorite() async {
    bool isFavorite = await UserServices.checkIfFavorite(lapangan);
    print("Favorite ? " + isSelected.toString());
    setState(() {
      isSelected = isFavorite;
    });
  }

  void initState() {
    getUserUpdate();
    checkIfFavorite();
    super.initState();
    gettransactions();
    print(itemList);
  }

  Future gettransactions() async {
    await trans
        .where("fieldid", isEqualTo: lapangan.fieldid)
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((element) {
                List temp = element.get("time");
                temp.forEach((element2) {
                  time.add(element2);
                });
              })
            });
  }

  @override
  // ignore: override_on_non_overriding_member
  bool isSelected = false;

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

  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("Cant open whatsapp");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          child: Stack(
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
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
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
                            lapangan.parent.nama, 23, Colors.white),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            lapangan.parent.kota,
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
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomCenter,
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
                                    // Tab(
                                    //   text: "Review",
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height + 10,
                                  child: TabBarView(children: [
                                    Column(
                                      children: [
                                        TableCalendar(
                                          calendarController: _controller,
                                          availableCalendarFormats: const {
                                            CalendarFormat.twoWeeks: '',
                                            CalendarFormat.month: ""
                                          },
                                          initialCalendarFormat:
                                              CalendarFormat.twoWeeks,
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
                                              leftChevronMargin:
                                                  EdgeInsets.only(left: 72),
                                              rightChevronMargin:
                                                  EdgeInsets.only(right: 72)),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        // Container(
                                        //   margin: EdgeInsets.only(left: 24),
                                        //   child: Align(
                                        //     alignment: Alignment.topLeft,
                                        //     child: Text(
                                        //       "Nomer Lapangan",
                                        //       style: TextStyle(
                                        //           color: primary_color,
                                        //           fontFamily: "Ubuntu",
                                        //           fontSize: 24,
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: 20,
                                        // ),
                                        // Row(
                                        //   children: [
                                        //     InkWell(
                                        //       onTap: () {
                                        //         changeNomerLapangan(
                                        //             "lapangan1");
                                        //       },
                                        //       child: Container(
                                        //         margin:
                                        //             EdgeInsets.only(left: 24),
                                        //         height: 56,
                                        //         width: 56,
                                        //         decoration:
                                        //             (selectedNomerLapangan ==
                                        //                     "lapangan1")
                                        //                 ? BoxDecoration(
                                        //                     color:
                                        //                         primary_color,
                                        //                     borderRadius:
                                        //                         BorderRadius
                                        //                             .all(Radius
                                        //                                 .circular(
                                        //                                     16)))
                                        //                 : BoxDecoration(),
                                        //         child: Center(
                                        //           child: Text(
                                        //             "1",
                                        //             style: TextStyle(
                                        //                 color:
                                        //                     (selectedNomerLapangan ==
                                        //                             "lapangan1")
                                        //                         ? Colors.white
                                        //                         : primary_color,
                                        //                 fontSize: 18,
                                        //                 fontWeight:
                                        //                     FontWeight.w500),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     InkWell(
                                        //       onTap: () {
                                        //         changeNomerLapangan(
                                        //             "lapangan2");
                                        //       },
                                        //       child: Container(
                                        //         margin:
                                        //             EdgeInsets.only(left: 24),
                                        //         height: 56,
                                        //         width: 56,
                                        //         decoration:
                                        //             (selectedNomerLapangan ==
                                        //                     "lapangan2")
                                        //                 ? BoxDecoration(
                                        //                     color:
                                        //                         primary_color,
                                        //                     borderRadius:
                                        //                         BorderRadius
                                        //                             .all(Radius
                                        //                                 .circular(
                                        //                                     16)))
                                        //                 : BoxDecoration(),
                                        //         child: Center(
                                        //           child: Text(
                                        //             "2",
                                        //             style: TextStyle(
                                        //                 color:
                                        //                     (selectedNomerLapangan ==
                                        //                             "lapangan2")
                                        //                         ? Colors.white
                                        //                         : primary_color,
                                        //                 fontSize: 18,
                                        //                 fontWeight:
                                        //                     FontWeight.w500),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     InkWell(
                                        //       onTap: () {
                                        //         changeNomerLapangan(
                                        //             "lapangan3");
                                        //       },
                                        //       child: Container(
                                        //         margin:
                                        //             EdgeInsets.only(left: 24),
                                        //         height: 56,
                                        //         width: 56,
                                        //         decoration:
                                        //             (selectedNomerLapangan ==
                                        //                     "lapangan3")
                                        //                 ? BoxDecoration(
                                        //                     color:
                                        //                         primary_color,
                                        //                     borderRadius:
                                        //                         BorderRadius
                                        //                             .all(Radius
                                        //                                 .circular(
                                        //                                     16)))
                                        //                 : BoxDecoration(),
                                        //         child: Center(
                                        //           child: Text(
                                        //             "3",
                                        //             style: TextStyle(
                                        //                 color:
                                        //                     (selectedNomerLapangan ==
                                        //                             "lapangan3")
                                        //                         ? Colors.white
                                        //                         : primary_color,
                                        //                 fontSize: 18,
                                        //                 fontWeight:
                                        //                     FontWeight.w500),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
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
                                          padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  15,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  15),
                                          child: GridView.builder(
                                              shrinkWrap: true,
                                              itemCount: itemList.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 4,
                                                      childAspectRatio: 1.5,
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 10),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    if (int.parse(itemList[index]
                                                                .toString()
                                                                .substring(
                                                                    0, 2)) >=
                                                            int.parse(lapangan
                                                                .parent.open
                                                                .substring(
                                                                    0, 2)) &&
                                                        int.parse(itemList[index].toString().substring(0, 2)) <
                                                            int.parse(lapangan
                                                                .parent.close
                                                                .substring(
                                                                    0, 2)) &&
                                                        //cek transaksi
                                                        !time
                                                            .contains(itemList[index])) {
                                                      setState(() {
                                                        if (selectedList !=
                                                            null) {
                                                          if (selectedList
                                                              .contains(
                                                                  itemList[
                                                                      index])) {
                                                            selectedList.remove(
                                                                itemList[
                                                                    index]);
                                                          } else {
                                                            selectedList.add(
                                                                itemList[
                                                                    index]);
                                                          }
                                                        }
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 60,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    decoration: (selectedList !=
                                                                null &&
                                                            selectedList
                                                                .contains(
                                                                    itemList[
                                                                        index]))
                                                        ? BoxDecoration(
                                                            color:
                                                                primary_color,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0))
                                                        : BoxDecoration(),
                                                    child: Center(
                                                      child: Text(
                                                        itemList[index],
                                                        style: checkTime(index),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 16),
                                          width: 300,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0)),
                                            color: primary_color,
                                            textColor: Colors.white,
                                            onPressed: () {
                                              selectedList.sort((a, b) =>
                                                  int.parse(
                                                          a
                                                              .toString()
                                                              .substring(0, 2))
                                                      .compareTo(int.parse(b
                                                          .toString()
                                                          .substring(0, 2))));
                                              String tanggal = _controller
                                                  .selectedDay
                                                  .toIso8601String();
                                              String tanggalfix =
                                                  tanggal.substring(
                                                      0, tanggal.indexOf("T"));

                                              if (selectedList.length > 0) {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return PaymentDetails(
                                                      lapangan: lapangan,
                                                      date: tanggalfix,
                                                      time: selectedList,
                                                      subtotal: "subtotal",
                                                      status: "In Progress",
                                                      couponid: "couponid",
                                                      total: "total",
                                                      ordertime: "ordertime");
                                                }));
                                              } else {
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "Pilih Jam Terlebih Dahulu",
                                                  toastLength:
                                                      Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.BOTTOM,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 20.0,
                                                );
                                              }

                                              // selectedList.sort((a,b)=>int.parse(a.toString().substring(0,2)).compareTo(int.parse(b.toString().substring(0,2))));
                                              // String tanggal = _controller
                                              //     .selectedDay
                                              //     .toIso8601String();
                                              // String tanggalfix =
                                              //     tanggal.substring(
                                              //         0, tanggal.indexOf("T"));
                                              // launchWhatsapp(
                                              //     number: "+6281391097676",
                                              //     message: "Saya " +
                                              //         name +
                                              //         " mau booking lapangan " + lapangan.jenis + " di " +
                                              //         lapangan.parent.nama +
                                              //         " lapangan nomer: "  + lapangan.no + " jam: " +
                                              //         selectedList[0] +
                                              //         " - " + selectedList[selectedList.length-1] + " pada tanggal : " +
                                              //         tanggalfix);
                                              // addTransaction(
                                              //     lapangan.parent.nama,
                                              //     lapangan.no,
                                              //     lapangan.jenis,
                                              //     tanggalfix,
                                              //     selectedList,
                                              //     "subtotal",
                                              //     "In Progress",
                                              //     "couponid",
                                              //     lapangan.harga*selectedList.length,
                                              //     DateTime.now());
                                            },
                                            child: Text(
                                              "Booking Lapangan",
                                              style: TextStyle(
                                                  fontFamily: "Ubuntu",
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 20,
                                        // )
                                      ],
                                    ),

                                    Container(
                                        padding: EdgeInsets.only(
                                            top: 8, right: 32, left: 32),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                    margin: EdgeInsets.only(
                                                        right: 16),
                                                    child: Image.asset(
                                                      "assets/images/placeholder.png",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            150,
                                                    child: Text(
                                                      lapangan.parent.alamat,
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
                                                    margin: EdgeInsets.only(
                                                        right: 16),
                                                    child: Image.asset(
                                                      "assets/images/phone.png",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Text(lapangan.parent.telp),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 24),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 16),
                                                    child: Image.asset(
                                                      "assets/images/clock.png",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Text(lapangan.parent.open +
                                                      " - " +
                                                      lapangan.parent.close),
                                                ],
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 16,
                                            // ),
                                            // Container(
                                            //   child: Align(
                                            //     alignment: Alignment.topLeft,
                                            //     child: Text(
                                            //       "Location",
                                            //       style: TextStyle(
                                            //           color: primary_color,
                                            //           fontFamily: "Ubuntu",
                                            //           fontSize: 32,
                                            //           fontWeight: FontWeight.bold),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        )),
                                    // Text("review")
                                  ])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                initialChildSize: 0.55,
                minChildSize: 0.55,
                maxChildSize: 0.74,
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

  TextStyle checkTime(int index) {
    if (int.parse(itemList[index].toString().substring(0, 2)) >=
            int.parse(lapangan.parent.open.substring(0, 2)) &&
        int.parse(itemList[index].toString().substring(0, 2)) <
            int.parse(lapangan.parent.close.substring(0, 2))) {
      if ( //cek transaksi
          time.contains(itemList[index])) {
        return TextStyle(
            color:
                (selectedList != null && selectedList.contains(itemList[index]))
                    ? Colors.white
                    : Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.w600);
      } else {
        return TextStyle(
            color:
                (selectedList != null && selectedList.contains(itemList[index]))
                    ? Colors.white
                    : Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.w600);
      }
    } else {
      return TextStyle(
          color:
              (selectedList != null && selectedList.contains(itemList[index]))
                  ? Colors.white
                  : Colors.grey.withOpacity(0.4),
          fontSize: 18,
          fontWeight: FontWeight.w600);
    }
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
