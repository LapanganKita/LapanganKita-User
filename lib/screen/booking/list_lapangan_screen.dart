part of 'bookings.dart';

// ignore: must_be_immutable
class ListLapangan extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  String tipe = "";
  ListLapangan({Key key, this.tipe}) : super(key: key);
  _ListLapanganState createState() => _ListLapanganState();
}

class _ListLapanganState extends State<ListLapangan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: primary_color, title: Text("${widget.tipe}")),
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
                        prefixIcon: Icon(Icons.search, color: primary_color),
                        labelText: 'Cari Lapangan',
                        hintText: "Nama Lapangan",
                        labelStyle: TextStyle(color: primary_color),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary_color),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('Lapangan')
                                  .where("jenis", isEqualTo: '${widget.tipe}')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Text("No field");
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SpinKitFadingCircle(
                                    size: 50,
                                    color: Colors.blue,
                                  );
                                } else {
                                  print(snapshot);
                                  print("${widget.tipe}");
                                }
                                return Column(
                                    children: snapshot.data.docs
                                        .map((DocumentSnapshot document) {
                                  Lapangans lapangan = Lapangans(
                                      document.get('fieldid'),
                                      document.get('jenis'),
                                      document.get('review'),
                                      document.get('harga'),
                                      document.get('details'),
                                      document.get('jam'),
                                      document.get('nomerlapangan'),
                                      document.get('partnerid'));
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: CardLapangan(
                                        lapangan: lapangan, offset: 0),
                                  );
                                }).toList());
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
