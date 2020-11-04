import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> CreateUser(String name, email, password) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'email': email,
    'password': password,
    'uid': uid,
  });
  return;
}
