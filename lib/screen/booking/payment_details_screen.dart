part of 'bookings.dart';

const CHANNEL = "com.lapangankita.mobile";
const KEY_NATIVE = "showPAYMENTLAPANGANKITA";

// ignore: must_be_immutable
class PaymentDetails extends StatefulWidget {
  Lapangan lapangan;
  String partnerid;
  String fieldid;
  String date;
  List time;
  String subtotal;
  String status;
  String couponid;
  String total;
  String ordertime;

  final ValueChanged<bool> isSelected;
  PaymentDetails(
      {Key key,
      this.lapangan,
      this.isSelected,
      this.partnerid,
      this.fieldid,
      this.date,
      this.time,
      this.subtotal,
      this.status,
      this.couponid,
      this.total,
      this.ordertime})
      : super(key: key);
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState(
      lapangan, date, time, subtotal, status, couponid, total, ordertime);
}

class _PaymentDetailsState extends State<PaymentDetails> {
  static const platform = const MethodChannel(CHANNEL);

  Lapangan lapangan;
  String date;
  List time;
  String subtotal;
  String status;
  String couponid;
  String total;
  String ordertime;
  _PaymentDetailsState(this.lapangan, this.date, this.time, this.subtotal,
      this.status, this.couponid, this.total, this.ordertime);

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  String name = "";
  User _auth = FirebaseAuth.instance.currentUser;
  // voucherController
  TextEditingController voucherController = TextEditingController();

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

  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("Cant open whatsapp");
  }

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
                                    lapangan.parent.nama,
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
                                child: Text(name,
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
                              child: Text(date,
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
                              child: Text(lapangan.parent.alamat,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(height: 24),
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
                              child: Text(
                                  time[0] + " - " + time[time.length - 1],
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
                              child: Text(
                                  "Rp. " +
                                      (time.length * lapangan.harga).toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          obscureText: false,
                          controller: voucherController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle,
                                color: primary_color),
                            labelText: 'Kode Diskon',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 56),
                            width: 300,
                            height: 56,
                            child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: Text(
                                  "Booking",
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontSize: 18,
                                      color: primary_color),
                                ),
                                onPressed: () {
                                  _showNativeView();
                                  // if (time.isEmpty) {
                                  //   // final stopwatch = Stopwatch()..start();

                                  //   Fluttertoast.showToast(
                                  //     msg: "Error data tidak sesuai.",
                                  //     toastLength: Toast.LENGTH_LONG,
                                  //     gravity: ToastGravity.BOTTOM,
                                  //     backgroundColor: Colors.red,
                                  //     textColor: Colors.white,
                                  //     fontSize: 20.0,
                                  //   );
                                  //   // stopwatch.stop();
                                  //   // print(
                                  //   //     'Kode Diskon executed in ${stopwatch.elapsed}');
                                  // } else {
                                  //   final stopwatch = Stopwatch()..start();
                                  //   Timer(Duration(milliseconds: 32), () {
                                  //     print(
                                  //         "Yeah, this line is printed after 3 second");
                                  //   });
                                  //   stopwatch.stop();
                                  //   print(
                                  //       'Kode Diskon executed in ${stopwatch.elapsed}');

                                  //   stopwatch.start();

                                  //   launchWhatsapp(
                                  //       number: "+6281391097676",
                                  //       message: "Saya " +
                                  //           name +
                                  //           " mau booking lapangan " +
                                  //           lapangan.jenis +
                                  //           " di " +
                                  //           lapangan.parent.nama +
                                  //           " lapangan nomer: " +
                                  //           lapangan.no +
                                  //           " jam: " +
                                  //           time[0] +
                                  //           " - " +
                                  //           time[time.length - 1] +
                                  //           " pada tanggal : " +
                                  //           date);
                                  addTransaction(
                                      lapangan.parent.nama,
                                      lapangan.id,
                                      lapangan.jenis,
                                      date,
                                      time,
                                      "subtotal",
                                      "In Progress",
                                      "couponid",
                                      lapangan.harga * time.length,
                                      DateTime.now());
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return NavBar();
                                    }),
                                  );
                                  //   stopwatch.stop();

                                  //   print(
                                  //       'Review Booking executed in ${stopwatch.elapsed}');
                                  // }
                                })),
                        Container(
                            margin: EdgeInsets.only(top: 24),
                            width: 300,
                            height: 56,
                            child: RaisedButton(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: Text(
                                  "Batalkan",
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  // Scaffold.of(context)
                                  //     .showSnackBar(new SnackBar(
                                  //   content: new Text('Hello!'),
                                  // ));
                                  Navigator.pop(context);
                                })),
                        SizedBox(height: 24),
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

  Future<Null> _showNativeView() async {
    // print(widget.lapangan.parent.nama + " - " + widget.date);
    await platform.invokeMethod(KEY_NATIVE, {
      "name": widget.lapangan.parent.nama + " - " + widget.date,
      "price": (widget.lapangan.harga * widget.time.length) + 1500,
      "quantity": 1,
    });
  }
}
