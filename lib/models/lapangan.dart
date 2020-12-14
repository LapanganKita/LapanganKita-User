import 'package:equatable/equatable.dart';

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
}
