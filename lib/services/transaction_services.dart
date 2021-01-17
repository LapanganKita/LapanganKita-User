part of 'services.dart';

Future<void> addTransaction(String partnerid, fieldid,jenis, date, time, subtotal,
    status, couponid, total, ordertime) async {
  CollectionReference transactions =
      FirebaseFirestore.instance.collection("Transactions");
  transactions.add({
    'partnerid': partnerid,
    'fieldid': fieldid,
    'jenis' : jenis,
    'date': date,
    'time': FieldValue.arrayUnion(time),
    'subtotal': subtotal,
    'status': status,
    'couponid': couponid,
    'total': total,
    'ordertime': ordertime,
  }).then((doc) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    DocumentReference user = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("transactions")
        .doc(doc.id);
    user.set({
      "transactionid": doc.id,
      'partnerid': partnerid,
      'fieldid': fieldid,
      'jenis' : jenis,
      'date': date,
      'time': FieldValue.arrayUnion(time),
      'subtotal': subtotal,
      'status': status,
      'couponid': couponid,
      'total': total,
      'ordertime': ordertime,
    });
  });

  return;
}
