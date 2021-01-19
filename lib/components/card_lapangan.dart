part of 'components.dart';

class CardLapangan extends StatelessWidget {
  final Lap lapangan;
  final double offset;

  const CardLapangan({
    Key key,
    @required this.lapangan,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.05));
    return Transform.translate(
      offset: Offset(-16 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return BookingLapangan(lapangan: lapangan);
              }),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                // height: MediaQuery.of(context).size.height * 0.1,
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  child: Image.asset(
                    // 'assets/images/$lapangan',
                    'assets/images/lapangan_futsal.png',
                    alignment: Alignment(-offset.abs() - 0.2, 0),
                    scale: 2.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: CardContent(
                  name: lapangan.parent.nama,
                  type: lapangan.jenis,
                  shortDesc: lapangan.details,
                  priceRange: lapangan.harga.toString(),
                  offset: gauss,
                  rating: 5,
                  location: lapangan.parent.alamat,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String type;
  final String shortDesc;
  final String priceRange;
  final double offset;
  final double rating;
  final String location;

  const CardContent({
    Key key,
    @required this.name,
    @required this.type,
    @required this.shortDesc,
    @required this.priceRange,
    @required this.offset,
    @required this.rating,
    @required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Transform.translate(
                // Nama Lapangan
                offset: Offset(24 * offset, 0),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(-16 * offset, 0),
                child: Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.yellow[800],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Transform.translate(
                  // Lokasi Lapangan
                  offset: Offset(24 * offset, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // SizedBox(width: 16),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.translate(
                offset: Offset(-16 * offset, 0),
                child: Text(
                  "Open 10:00 - 23:00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(-16 * offset, 0),
                child: Text(
                  NumberFormat.currency(
                          locale: "id", symbol: "Rp ", decimalDigits: 0)
                      .format(int.parse(priceRange.toString())),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
          // Spacer(),
          // Row(
          //   children: <Widget>[
          //     Transform.translate(
          //       offset: Offset(24 * offset, 0),
          //       child: RaisedButton(
          //         color: Color(0xFF162A49),
          //         child: Transform.translate(
          //           offset: Offset(0 * offset, 0),
          //           child: Text('Selengkapnya'),
          //         ),
          //         textColor: Colors.white,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(32),
          //         ),
          //         onPressed: () {},
          //       ),
          //     ),
          //     Spacer(),
          //     Transform.translate(
          //       offset: Offset(0 * offset, 0),
          //       child: Text(
          //         priceRange,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20,
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 16),
          //   ],
          // )
        ],
      ),
    );
  }
}
