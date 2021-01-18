part of 'homes.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

String uid = FirebaseAuth.instance.currentUser.uid.toString();
CollectionReference transactionCollection = FirebaseFirestore.instance
    .collection("Users")
    .doc(uid)
    .collection("transactions");

class _HistoryScreenState extends State<HistoryScreen> {
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
              Container(
                child: StreamBuilder<QuerySnapshot>(
                    stream: transactionCollection.where('status', isEqualTo: "In Progress").snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Failed to get products data!");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitFadingCircle(
                          size: 50,
                          color: Colors.blue,
                        );
                      }
                      return ListView(
                        children: snapshot.data.docs.map((DocumentSnapshot doc) {
                          print(doc.data()[FieldValue.arrayUnion]);
                          return Cardtransaction(
                            transaction: Trans(
                                doc.data()['partnerid'],
                                doc.data()['fieldid'],
                                doc.data()['date'],
                                List.from(doc['time']),
                                doc.data()['subtotal'],
                                doc.data()['status'],
                                doc.data()['couponid'],
                                doc.data()['total'].toString(),
                                doc.data()['datetime']),
                          );
                        }).toList(),
                      );
                    }),
              ),
              Container(
                child: StreamBuilder<QuerySnapshot>(
                    stream: transactionCollection.where('status', isEqualTo: "Done").snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Failed to get products data!");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitFadingCircle(
                          size: 50,
                          color: Colors.blue,
                        );
                      }
                      return ListView(
                        children: snapshot.data.docs.map((DocumentSnapshot doc) {
                          print(doc.data()[FieldValue.arrayUnion]);
                          return Cardtransaction(
                            transaction: Trans(
                                doc.data()['partnerid'],
                                doc.data()['fieldid'],
                                doc.data()['date'],
                                List.from(doc['time']),
                                doc.data()['subtotal'],
                                doc.data()['status'],
                                doc.data()['couponid'],
                                doc.data()['total'].toString(),
                                doc.data()['datetime']),
                          );
                        }).toList(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
