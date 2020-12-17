part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  static DocumentReference userDoc;
  static Reference ref;
  static UploadTask uploadTask;
  static String imageUrl;

  static Future<void> createUser(String name, email, password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    DocumentReference users = userCollection.doc(uid);
    users.set({
      'name': name,
      'email': email,
      'password': password,
      'uid': uid,
    });
    return;
  }

  static Future updateUserList(String name, email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    DocumentReference users = userCollection.doc(uid);
    users.update({
      'name': name,
      'email': email,
    });

    return;
  }

  static Future updateProfilePicture(String uid, PickedFile imageFile) async {
    String fileName = uid + ".png";
    ref = FirebaseStorage.instance
        .ref()
        .child('assets/profilePictures')
        .child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
        () => ref.getDownloadURL().then((value) => imageUrl = value));
    return userCollection
        .doc(uid)
        .update({
          'profilePicture': imageUrl,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }
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
