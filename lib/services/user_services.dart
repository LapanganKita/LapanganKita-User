part of 'services.dart';

Future<void> createUser(String name, email, password) async {
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

Future updateUserList(String name, email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  DocumentReference users =
      FirebaseFirestore.instance.collection("Users").doc(uid);
  users.update({
    'name': name,
    'email': email,
  });

  return;
}

// String username = "";
// String email = "";

// class GetUsername {
//   static Future<void> currentusername() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     String uid = auth.currentUser.uid.toString();
//     DocumentReference users =
//         FirebaseFirestore.instance.collection("Users").doc(uid);
//     DocumentSnapshot snapshot = await users.get();
//     username = snapshot.data()["name"];
//     return;
//   }
// }

// class GetEmail {
//   static Future<void> currentEmail() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     String uid = auth.currentUser.uid.toString();
//     DocumentReference users =
//         FirebaseFirestore.instance.collection("Users").doc(uid);
//     DocumentSnapshot snapshot = await users.get();
//     email = snapshot.data()["email"];
//     return;
//   }
// }
