part of 'bookings.dart';

// ignore: must_be_immutable
class ListLapangan extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  String tipe = "";
  ListLapangan({Key key, this.tipe}) : super(key: key);
  _ListLapanganState createState() => _ListLapanganState(tipe);
}

class _ListLapanganState extends State<ListLapangan> {
  String tipe = "";
  Future future;

  _ListLapanganState(this.tipe);

  @override
  void initState() {
    super.initState();
    Provider.of<ListLapanganViewModel>(context, listen: false)
        .fetchLapanganByType(tipe);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ListLapanganViewModel>(context);

    return Scaffold(
      appBar:
          AppBar(backgroundColor: primary_color, title: Text("${widget.tipe}")),
      body: Container(
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
            // Expanded(
            //   child: ListView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //     scrollDirection: Axis.vertical,
            //     itemCount: vm.laps.length,
            //     itemBuilder: (context, index) {
            //       return buildCardLapangan(context, index, vm.laps);
            //     },
            //   ),
            // )

            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: vm.laps.length,
                itemBuilder: (context, index) {
                  return buildCardLapangan(context, index, vm.laps);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCardLapangan(BuildContext context, int index, List<Lap> list) {
    print("index = " + index.toString());
    print(list[index].parent.nama);
    // return SizedBox(
    //   height: MediaQuery.of(context).size.height * 0.25,
    //   child: CardLapangan(lapangan: list[index], offset: 0),
    // );

    return AspectRatio(
      aspectRatio: 4 / 3,
      child: CardLapangan(lapangan: list[index], offset: 0),
    );
    // listPartners.forEach((partner) {
    //   if (partner.lapangans.length != 0) {
    //     partner.lapangans.forEach((lapangan) {
    //       if (lapangan.jenis == tipe) {
    //         return SizedBox(
    //           height: MediaQuery.of(context).size.height * 0.25,
    //           child: CardLapangan(lapangan: lapangan, offset: 0),
    //         );
    //       }
    //     });
    //   }
    // });

    // return SizedBox();
  }
}
