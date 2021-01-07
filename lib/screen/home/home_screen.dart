part of 'homes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // ignore: override_on_non_overriding_member
  User _auth = FirebaseAuth.instance.currentUser;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  String name = "";

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      name = event.data()['name'];
      setState(() {});
    });
  }

  void initState() {
    getUserUpdate();
    super.initState();
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
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 14,
                            top: MediaQuery.of(context).size.height / 14),
                        child: Text(
                          "Welcome,",
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
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 14,
                        ),
                        child: Text(name,
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 14,
                        top: MediaQuery.of(context).size.height / 24,
                      ),
                      // bottom: MediaQuery.of(context).size.height / 96),
                      child: Text("Category : ",
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width / 20,
                              16,
                              32,
                              0),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      // return ListLapangan(tipe: "Basket");
                                      return ChangeNotifierProvider(
                                        create: (context) =>
                                            ListLapanganViewModel(),
                                        child: ListLapangan(
                                          tipe: "Basket",
                                        ),
                                      );
                                    }),
                                  );
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
                                    return ChangeNotifierProvider(
                                      create: (context) =>
                                          ListLapanganViewModel(),
                                      child: ListLapangan(
                                        tipe: "Futsal",
                                      ),
                                    );
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
                                    return ChangeNotifierProvider(
                                      create: (context) =>
                                          ListLapanganViewModel(),
                                      child: ListLapangan(
                                        tipe: "Badminton",
                                      ),
                                    );
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
                                    return ChangeNotifierProvider(
                                      create: (context) =>
                                          ListLapanganViewModel(),
                                      child: ListLapangan(
                                        tipe: "Pingpong",
                                      ),
                                    );
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
                                        return VieMoreFavorites();
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
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('Lapangan')
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      print(snapshot);
                                    }
                                    return Column(
                                        children: snapshot.data.docs
                                            .map((DocumentSnapshot document) {
                                      return Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              72,
                                          height: 180,
                                          child: Card(
                                            child: InkWell(
                                              splashColor:
                                                  Colors.blue.withAlpha(30),
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return DetailLapangan();
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            80,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white60,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                topLeft: Radius
                                                                    .circular(
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
                                                              HeadingText
                                                                  .withColor(
                                                                document.data()[
                                                                    "details"],
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
                                                              Text(document
                                                                      .data()[
                                                                  "harga"])
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
                                      );
                                    }).toList());
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.8,
          ),
        ],
      )),
    );
  }
}
