part of 'models.dart';

class Mitra extends Equatable {
  final String alamat;
  final String close;
  final String kota;
  final String nama;
  final String open;
  final String telp;

  Mitra(
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

  static Mitra fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Mitra(
      map['alamat'],
      map['close'],
      map['kota'],
      map['nama'],
      map['open'],
      map['telp'],
    );
  }
}
