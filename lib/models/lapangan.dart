part of 'models.dart';

class Lapangans extends Equatable {
  final String fieldid;
  final String jenis;
  final String review;
  final String price;
  final String detail;
  final String jam;
  final String nolapangan;
  final String partnerid;

  Lapangans(this.fieldid, this.jenis, this.review, this.price, this.detail,
      this.jam, this.nolapangan, this.partnerid);

  @override
  List<Object> get props =>
      [fieldid, jenis, review, price, detail, jam, nolapangan, partnerid];

  Map<String, dynamic> toMap() {
    return {
      'id': fieldid,
      'jenis': jenis,
      'review': review,
      'harga': price,
      'details': detail,
      'jam': jam,
      'nomerlapangan': nolapangan,
      'partnerid': partnerid,
    };
  }

  static Lapangans fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Lapangans(
      map['fieldid'],
      map['jenis'],
      map['review'],
      map['harga'],
      map['details'],
      map['jam'],
      map['nomerlapangan'],
      map['partnerid'],
    );
  }
}
