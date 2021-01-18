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
    Provider.of<ListLapanganViewModel>(context, listen: false).fetchLapangan();
    Provider.of<FavoriteViewModel>(context, listen: false).fetchFavorite();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final vm = Provider.of<ListLapanganViewModel>(context);
    final favvm = Provider.of<FavoriteViewModel>(context);

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
                                  child:
                                      Image.asset("assets/images/football.png"),
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
                                      "assets/images/shuttlecock.png"),
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
                                            "assets/images/ping-pong.png"),
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
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        // Container(
                        //     child: HeadingText.withColor(
                        //         "Favorite", 28, primary_color)),
                        // Container(
                        //   child: Column(
                        //     children: [
                        //       // Container(
                        //       //   child: Align(
                        //       //     alignment: Alignment.centerRight,
                        //       //     child: GestureDetector(
                        //       //       onTap: () {
                        //       //         Navigator.push(context,
                        //       //             MaterialPageRoute(builder: (context) {
                        //       //           return ChangeNotifierProvider(
                        //       //             create: (context) =>
                        //       //                 FavoriteViewModel(),
                        //       //             child: VieMoreFavorites(),
                        //       //           );
                        //       //         }));
                        //       //       },
                        //       //       child: Text(
                        //       //         "View More",
                        //       //         style: TextStyle(color: Colors.grey),
                        //       //       ),
                        //       //     ),
                        //       //   ),
                        //       // ),
                        //       // Container(
                        //       //   height: 400,
                        //       //   child: Expanded(
                        //       //     child: ListView.builder(
                        //       //       physics: NeverScrollableScrollPhysics(),
                        //       //       scrollDirection: Axis.horizontal,
                        //       //       itemCount: favvm.laps.length,
                        //       //       itemBuilder: (context, index) {
                        //       //         return AspectRatio(
                        //       //           aspectRatio: 6 / 5,
                        //       //           child: CardLapangan(
                        //       //               lapangan: favvm.laps[index],
                        //       //               offset: 0),
                        //       //         );
                        //       //       },
                        //       //     ),
                        //       //   ),
                        //       // )
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          child: HeadingText.withColor(
                              "Lapangan", 28, primary_color),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: vm.laps.length,
                            itemBuilder: (context, index) {
                              return AspectRatio(
                                aspectRatio: 6 / 5,
                                child: CardLapangan(
                                    lapangan: vm.laps[index], offset: 0),
                              );
                            },
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
