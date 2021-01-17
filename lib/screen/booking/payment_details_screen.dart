part of 'bookings.dart';

// ignore: must_be_immutable
class PaymentDetails extends StatefulWidget {
  Lap lapangan;
  final ValueChanged<bool> isSelected;
  PaymentDetails({Key key, this.lapangan, this.isSelected}) : super(key: key);
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pembayaran",
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
          child: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width),
                decoration: BoxDecoration(color: Colors.white),
              ),
              Container(
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(
                                          0.1,
                                        ),
                                        offset: Offset(0, 10)),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                    "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                                  )),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: Text(
                                    "Sport Centre Puncak Permai",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: primary_color,
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Icon(
                                    Icons.account_box,
                                    color: Colors.white,
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 5),
                                child: Text("LapanganKita",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 5),
                              child: Text("1 Oktober 2021",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 5),
                              child: Text("Jl. Raya Darmo Permai III no 80",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Icon(
                                  Icons.lock_clock,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 5),
                              child: Text("10.00 - 12.00",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Icon(
                                  Icons.monetization_on,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 5),
                              child: Text("Rp 200.000",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 56),
                            width: 300,
                            height: 56,
                            child: RaisedButton(
                                color: primary_color,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: Text(
                                  "Booking",
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                                onPressed: null))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
