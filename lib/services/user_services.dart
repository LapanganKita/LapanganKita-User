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

  static Future<List<Lapangan>> getFavorite() async {
    // Untuk testing struktur database baru

    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    CollectionReference favorite = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Favorites");

    List<Lapangan> lapList = await LapanganService.getMitra();
    List<dynamic> favlist = [];
    List<Lapangan> lapFavlist = [];

    favorite.get().then((value) {
      print("fav length : " + value.docs.length.toString());
      if (value.docs.isNotEmpty) {
        favlist = value.docs.toList();
      }
    });

    print("fav list length : " + favlist.length.toString());

    favlist.forEach((fav) {
      print("Nama : " + fav["nama"]);
      lapList.forEach((lapangan) {
        if (lapangan.parent.nama == fav["nama"] &&
            lapangan.jenis == fav["jenis"] &&
            lapangan.no == fav["no"]) {
          lapFavlist.add(lapangan);
        }
      });
    });

    print("filtered fav : " + lapFavlist.length.toString());

    return lapFavlist;
  }

  static Future<bool> checkIfFavorite(Lapangan lapangan) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    CollectionReference favorite = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Favorites");

    favorite
        .where("nama", isEqualTo: lapangan.parent.nama)
        .where("no", isEqualTo: lapangan.no)
        .where("jenis", isEqualTo: lapangan.jenis)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        return false;
      } else {
        print("Is Favorite");
        return true;
      }
    });
    return false;
  }

  static Future<bool> addToFavorite(Lapangan lapangan) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    CollectionReference favorite = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Favorites");

    favorite
        .where("nama", isEqualTo: lapangan.parent.nama)
        .where("no", isEqualTo: lapangan.no)
        .where("jenis", isEqualTo: lapangan.jenis)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        try {
          favorite.add({
            "nama": lapangan.parent.nama,
            "jenis": lapangan.jenis,
            "no": lapangan.no,
            "date": DateTime.now()
          });

          print("tyring to add to favorite");

          return true;
        } catch (e) {
          print("Error while add lapangan to favorite : " + e.toString());
          return false;
        }
      } else {
        favorite
            .doc(value.docs.first.id)
            .get()
            .then((value) => print(value.data()));

        // try {
        //   favorite.doc(value.docs.first.id).set({
        //     "nama": lapangan.parent.nama,
        //     "jenis": lapangan.jenis,
        //     "no": lapangan.no,
        //     "date": DateTime.now()
        //   });

        //   print("tyring to add to favorite");

        //   return true;
        // } catch (e) {
        //   print("Error while add lapangan to favorite : " + e.toString());
        //   return false;
        // }

        return false;
      }
    });
    return false;

    // try {
    //   favorite.add({
    //     "nama": lapangan.parent.nama,
    //     "jenis": lapangan.jenis,
    //     "no": lapangan.no,
    //     "date": DateTime.now()
    //   });

    //   print("tyring to add to favorite");

    //   return true;
    // } catch (e) {
    //   print("Error while add lapangan to favorite : " + e.toString());
    //   return false;
    // }
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
