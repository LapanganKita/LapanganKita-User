part of 'viewmores.dart';

class VieMoreFavorites extends StatefulWidget {
  @override
  _VieMoreFavoritesState createState() => _VieMoreFavoritesState();
}

class _VieMoreFavoritesState extends State<VieMoreFavorites> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavoriteViewModel>(context, listen: false).fetchFavorite();
  }

  @override
  Widget build(BuildContext context) {
    final favvm = Provider.of<FavoriteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: primary_color,
          title: Text(
            "Favorite",
          )),
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
                    child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: favvm.laps.length,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                          aspectRatio: 6 / 5,
                          child: CardLapangan(
                              lapangan: favvm.laps[index], offset: 0),
                        );
                      },
                    ),
                  )
                ],
              ))),
    );
  }
}
