part of 'profiles.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User _user = FirebaseAuth.instance.currentUser;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  static String name = "";
  static String email = "";
  static String img = "";

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  void getUserUpdate() async {
    userCollection.doc(_user.uid).snapshots().listen((event) {
      name = event.data()['name'];
      email = event.data()['email'];
      img = event.data()['profilePicture'];
      if (img == "") {
        img = null;
      }
      setState(() {
        nameController.text = name;
        emailController.text = email;
      });
    });
  }

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
      img = selectedImage.path;
    });
  }

  void initState() {
    getUserUpdate();

    super.initState();
  }

  updateData(String name, String email) async {
    await UserServices.updateUserList(name, email);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
              color: primary_color,
              fontSize: 25,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: primary_color,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Profile Image ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                  color: primary_color),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await chooseImage();
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(
                                  0.1,
                                ),
                                offset: Offset(0, 10)),
                          ],
                          shape: BoxShape.circle,
                          image: buildDecorationImage()),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: primary_color),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: false,
              controller: nameController,
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle, color: primary_color),
                labelText: 'Nama',
                hintText: "Trevincent",
                labelStyle: TextStyle(color: primary_color),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primary_color),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (val) => val.isEmpty ? 'Enter Your Email' : null,
              onChanged: (val) {
                setState(() => email = val.trim());
              },
              obscureText: false,
              controller: emailController,
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: primary_color),
                labelText: 'Email',
                hintText: "Email",
                labelStyle: TextStyle(color: primary_color),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primary_color),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("CANCEL",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black)),
                ),
                RaisedButton(
                  onPressed: () {
                    UserServices.updateProfilePicture(_user.uid, imageFile);
                    submitOption(context);
                    Navigator.pop(context);
                  },
                  color: primary_color,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Ubuntu",
                        color: Colors.white,
                        letterSpacing: 2.2),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  DecorationImage buildDecorationImage() {
    if (img == null) {
      return DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            img ?? "assets/images/blankprofile.png",
          ));
    } else {
      return DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            img,
          ));
    }
  }

  submitOption(BuildContext context) {
    updateData(nameController.text, emailController.text);
    nameController.clear();
    emailController.clear();
  }
}
