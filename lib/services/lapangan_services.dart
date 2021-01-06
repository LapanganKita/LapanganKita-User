part of 'services.dart';

class LapanganService {
  static CollectionReference lapangansCol =
      FirebaseFirestore.instance.collection("Lapangan");
  static DocumentReference lapangansDoc;

  static Future<List<Lapangans>> getLapangans() async {
    // TODO : Get data lapangan lalu return List lapangan
    try {
      var lapDocs = await lapangansCol.get();
      if (lapDocs.docs.isNotEmpty) {
        print("docs size = " + lapDocs.docs.length.toString());
        return lapDocs.docs
            .map((snapshot) => Lapangans.fromMap(snapshot.data()))
            .toList();
      } else
        return null;
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<List<Lapangans>> getLapangansFromPartners(
      List<dynamic> uid) async {
    // TODO : Get data lapangan lalu return List lapangan
    List<Lapangans> listPartners = List<Lapangans>();
    try {
      lapangansCol.get().then((QuerySnapshot snapshot) => {
            snapshot.docs.forEach((element) {
              if (uid.contains(element.id))
                listPartners.add(convertToLapangans(element));
            })
          });
    } catch (error) {
      return error;
    }

    return listPartners;
  }

  static Lapangans convertToLapangans(DocumentSnapshot doc) {
    // TODO : Convert data hasil snapshot menjadi object lapangan dan return
    return new Lapangans(
      doc.get('fieldid'),
      doc.get('jenis'),
      doc.get('review'),
      doc.get('harga'),
      doc.get('details'),
      doc.get('jam'),
      doc.get('nomerlapangan'),
      doc.get('partnerid'),
    );
  }
}
