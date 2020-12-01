import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/constant.dart';
import 'package:lapangankita_user/databaseManager/firebase.dart';
import 'package:lapangankita_user/screen/home/profile_screen.dart';
import 'package:lapangankita_user/screen/wrapper.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  void initState() {
    super.initState();
    GetUsername.Currentusername();
    GetEmail.CurrentEmail();
  }

  updatData(String name, String email) async {
    await updateUserList(name, email);
  }

  final TextEditingController nameController = TextEditingController()
    ..text = username;
  final TextEditingController emailController = TextEditingController()
    ..text = email;
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Wrapper();
              }));
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
                  Container(
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
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                          ),
                        )),
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
                    Navigator.push(
                        context, PageRouteBuilder(pageBuilder: null));
                  },
                  child: Text("CANCEL",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black)),
                ),
                RaisedButton(
                  onPressed: () {
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

  submitOption(BuildContext context) {
    updatData(nameController.text, emailController.text);
    nameController.clear();
    emailController.clear();
  }
}
