part of 'models.dart';

// ignore: must_be_immutable
class Trans extends Equatable {
  String partnerid;
  String fieldid;
  String date;
  List time;
  String subtotal;
  String status;
  String couponid;
  String total;
  String ordertime;

  Trans(
      this.partnerid,
      this.fieldid,
      this.date,
      this.time,
      this.subtotal,
      this.status,
      this.couponid,
      this.total,
      this.ordertime);

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props =>
      [partnerid, fieldid, date, time, subtotal, status, couponid, total, ordertime];
}
