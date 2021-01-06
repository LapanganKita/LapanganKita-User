part of 'models.dart';

class Partners extends Equatable {
  final String id;
  final String alamat;
  final String jam;
  final String nama;
  final String telp;
  final List<Lapangans> lapangans;

  Partners(this.id, this.nama, this.alamat, this.telp,
      {this.jam, this.lapangans});

  @override
  List<Object> get props => [id, nama, alamat, telp, jam, lapangans];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'alamat': alamat,
      'telp': telp,
      'jam': jam,
      'lapangan': lapangans,
    };
  }

  static Partners fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    List<Lapangans> lapangans = List<Lapangans>();
    print(map['lapangan']);

    if ((map['lapangans'] as List) != null) {
      lapangans = (map['lapangans'] as List)
          .map((data) => Lapangans.fromMap(data))
          .toList();

      print("lapangans = " + lapangans.toString());
      print("lapangans = " + lapangans.length.toString());
    }

    return Partners(
      map['id'],
      map['nama'],
      map['alamat'],
      map['telp'],
      jam: map['jam'],
      lapangans: lapangans,
    );
  }
}
