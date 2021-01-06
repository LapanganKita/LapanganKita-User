part of 'services.dart';

class PartnerService {
  static CollectionReference partnersCol =
      FirebaseFirestore.instance.collection("Partners");
  static DocumentReference partnersDoc;

  Future<List<Partners>> getPartners() async {
    // List<Partners> listPartners = List<Partners>();
    try {
      var partnersDocs = await partnersCol.get();
      if (partnersDocs.docs.isNotEmpty) {
        print("docs size = " + partnersDocs.docs.length.toString());
        return partnersDocs.docs
            .map((snapshot) => Partners.fromMap(snapshot.data()))
            .toList();
      } else
        return null;
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<Partners> convertToPartner(DocumentSnapshot doc) async {
    // TODO : Gunakan service getLapangan pada LapanganService
    List<Lapangans> listLapangan =
        await LapanganService.getLapangansFromPartners(
            List.from(doc.data()["lapangan"]));

    return new Partners(
      doc.id,
      doc.get('nama'),
      doc.get('alamat'),
      doc.get('telp'),
      jam: doc.get('jam'),
      lapangans: listLapangan,
    );
  }
}
