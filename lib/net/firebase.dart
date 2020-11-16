import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> CreateUser(String name, email, password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  DocumentReference users =
      FirebaseFirestore.instance.collection("Users").doc(uid);
  users.set({
    'name': name,
    'email': email,
    'password': password,
    'uid': uid,
  });
  return;
}

String username = "";

class Joni {
  static Future<void> Currentusername() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    DocumentReference users =
        FirebaseFirestore.instance.collection("Users").doc(uid);
    DocumentSnapshot snapshot = await users.get();
    username = snapshot.data()["name"];
    return;
  }
}

class FetchDataLapangan {
  final CollectionReference _lapanganList =
      FirebaseFirestore.instance.collection("Lapangan");

  Future getLapanganList() async {
    List itemList = [];

    try {
      await _lapanganList.get().then((querysnapshot) {
        querysnapshot.docs.forEach((element) {
          itemList.add(element.data());
        });
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
