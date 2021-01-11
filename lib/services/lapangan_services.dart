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

  static Future<List<Lap>> getTest() async {
    // Untuk testing struktur database baru

    CollectionReference testCol =
        FirebaseFirestore.instance.collection("Tests");
    DocumentReference testDoc;

    List<Lap> lapList = [];
    List<Test> testList = [];

    try {
      // Ambil documents pada test collection
      // List list_of_masters = await testCol.get().then((val) => val.docs.toList());

      // list_of_masters.forEach((element) {
      //   testCol.doc(element.documentID).collection("lapangan")
      //   element.documentID.toString()).collection("courses").snapshots().listen(CreateListofCourses);
      // });
      var testDoc = await testCol.get();
      if (testDoc.docs.isNotEmpty) {
        print("docs size = " + testDoc.docs.length.toString());

        for (var i = 0; i < testDoc.docs.length; i++) {
          var lapDoc = await testCol
              .doc(testDoc.docs[i].id)
              .collection("lapangan")
              .get();
          if (lapDoc.docs.isNotEmpty) {
            print("lapangan docs size = " + testDoc.docs.length.toString());
            lapDoc.docs.forEach((element) {
              Lap l = Lap.fromMap(
                  element.data(), Test.fromMap(testDoc.docs[i].data()));
              print(l.parent.nama);
              lapList.add(l);
            });
          }
        }
        print("Length = ");
        print(lapList.length);
        return lapList;
      } else
        return null;
    } catch (error) {
      print(error);
      return null;
    }
  }
}

class Test extends Equatable {
  final String alamat;
  final String close;
  final String kota;
  final String nama;
  final String open;
  final String telp;

  Test(
    this.alamat,
    this.close,
    this.kota,
    this.nama,
    this.open,
    this.telp,
  );

  @override
  List<Object> get props => [
        alamat,
        close,
        kota,
        nama,
        open,
        telp,
      ];

  Map<String, dynamic> toMap() {
    return {
      'alamat': alamat,
      'close': close,
      'kota': kota,
      'nama': nama,
      'open': open,
      'telp': telp,
    };
  }

  static Test fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Test(
      map['alamat'],
      map['close'],
      map['kota'],
      map['nama'],
      map['open'],
      map['telp'],
    );
  }
}

class Lap extends Equatable {
  final String details;
  final int harga;
  final String jenis;
  final String no;
  final Test parent;

  Lap(
    this.details,
    this.harga,
    this.jenis,
    this.no, {
    this.parent,
  });

  @override
  List<Object> get props => [
        details,
        harga,
        jenis,
        no,
        parent,
      ];

  Map<String, dynamic> toMap() {
    return {
      'details': details,
      'harga': harga,
      'jenis': jenis,
      'no': no,
    };
  }

  static Lap fromMap(Map<String, dynamic> map, Test parent) {
    if (map == null) return null;

    return Lap(map['details'], map['harga'], map['jenis'], map['no'],
        parent: parent);
  }
}
