part of 'models.dart';

class Lapangan extends Equatable {
  final String details;
  final String fieldid;
  final int harga;
  final String jenis;
  final String no;
  final String id;
  final Mitra parent;

  Lapangan(
    this.details,
    this.fieldid,
    this.harga,
    this.jenis,
    this.no,
    this.id, {
    this.parent,
  });

  @override
  List<Object> get props => [
        details,
        fieldid,
        harga,
        jenis,
        no,
        id,
        parent,
      ];

  Map<String, dynamic> toMap() {
    return {
      'details': details,
      'fieldid': fieldid,
      'harga': harga,
      'jenis': jenis,
      'no': no,
      'Lapangananganid': id
    };
  }

  static Lapangan fromMap(Map<String, dynamic> map, Mitra parent) {
    if (map == null) return null;
    print(map);

    return Lapangan(map['details'], map['Lapangananganid'], map['harga'],
        map['jenis'], map['no'], map['Lapangananganid'],
        parent: parent);
  }
}
